import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UnsplashImages(),
    );
  }
}

class UnsplashImages extends StatefulWidget {
  const UnsplashImages({Key? key}) : super(key: key);

  @override
  State<UnsplashImages> createState() => _UnsplashImagesState();
}

class _UnsplashImagesState extends State<UnsplashImages> {
  String image1 = "";
  String image2 = "";
  String image3 = "";
  String image4 = "";
  String image5 = "";
  String image6 = "";

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  void _fetchImages() async {
    var url =
    Uri.parse('https://api.unsplash.com/photos/random/?count=6&client_id=1QHAq4jNji7bpt_wbj06TP8zAv8vnQCLT46l2d8KIKU');
    var response = await http.get(url);
    var jsonData = json.decode(response.body);

    setState(() {
      image1 = jsonData[0]['urls']['regular'];
      image2 = jsonData[1]['urls']['regular'];
      image3 = jsonData[2]['urls']['regular'];
      image4 = jsonData[3]['urls']['regular'];
      image5 = jsonData[4]['urls']['regular'];
      image6 = jsonData[5]['urls']['regular'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.network(image1)
            ),
            Expanded(
                child: Image.network(image2)
            ),
          ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.network(image3)
              ),
              Expanded(
                  child: Image.network(image4)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.network(image5)
              ),
              Expanded(
                  child: Image.network(image6)
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}



