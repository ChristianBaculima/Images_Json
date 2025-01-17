import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:images_json/models/images_json.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagesJson? imgsjson;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    try {
      final response = await Dio()
          .get('https://api.flickr.com/services/feeds/photos_public.gne');
      imgsjson = ImagesJson.fromJson(response.data);
      // setState(() {});
    } catch (error) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagenes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imgsjson?.tags ?? 'No data'),
            if (imgsjson != null) ...[Image.network(imgsjson!.media as String)]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImages, child: const Icon(Icons.navigate_next)),
    );
  }
}
