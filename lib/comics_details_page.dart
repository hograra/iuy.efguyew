import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComicDetailPage extends StatelessWidget {
  final String imagePath;
  final String description;
  ComicDetailPage({required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Подробности комикса'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.0,
            child: PageView(
              children: [
                Image.network(imagePath, width: 120),
                Image.network('https://ir.ozone.ru/s3/multimedia-x/wc1000/6335777649.jpg', width: 120),
                Image.network('https://ir.ozone.ru/s3/multimedia-0/wc1000/6335777652.jpg', width: 120),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}