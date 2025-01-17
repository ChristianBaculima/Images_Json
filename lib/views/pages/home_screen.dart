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
  final Dio _dioDirections = Dio();

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    try {
      final response = await _dioDirections.get(
        'https://api.flickr.com/services/feeds/photos_public.gne?tags=priime&format=json&nojsoncall%20back=1',
      );
      response;
      imgsjson = ImagesJson.fromJson(response.data);
      setState(() {});
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
            if (imgsjson != null) ...[Image.network(imgsjson!.media as String)],
            Text(imgsjson?.tags ?? 'No data'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImages, child: const Icon(Icons.refresh)),
    );
  }
}
