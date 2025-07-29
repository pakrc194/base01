import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<void> fetchData() async {
    try {
      var dio = Dio();
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      print("data : ${response.data}");
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: fetchData,
            child: const Text('Fetch Data'),
          ),
        ),
      ),
    );
  }

  
}
