import 'dart:convert' as cnv;
import 'dart:ffi';
import 'package:flutter_gtech_project/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gtech_project/models/model.dart';
import 'package:flutter_gtech_project/screens/DetailPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Model>> model;

  @override
  void initState() {
    super.initState();
    model = Service.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder<List<Model>?>(
        future: model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].id.toString()),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data![index].thumbnailUrl),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(model: snapshot.data![index])));
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, size: 30),
                    onPressed: () {
                      setState(() {
                        snapshot.data?.removeAt(index);
                      });
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
