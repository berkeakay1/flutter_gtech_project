import 'package:flutter/material.dart';
import 'package:flutter_gtech_project/models/model.dart';

class DetailPage extends StatelessWidget {
  final Model model;

  const DetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Column(
        children: [
          Image.network(model.url),
          const SizedBox(
            height: 10,
          ),
          Text("Album ID: ${model.albumId}")
        ],
      ),
    );
  }
}
