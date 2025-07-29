import 'package:base01/openapi.dart';
import 'package:base01/signup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:base01/scrollview.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData.light(),      // Light theme
      darkTheme: ThemeData.dark(),   // Dark theme
      themeMode: ThemeMode.dark,   // Use system setting (auto switch)
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupApp()),
                );
              },
              child: const Text('Signup Button'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Openapi()),
                );
              },
              child: const Text('Open API Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScrollViewExample()),
                );
              },
              child: const Text('ScrollView Example'),
            ),
          ],
        ),
      ),
    );
  }
}