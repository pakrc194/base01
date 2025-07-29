import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var username = "pakrc194";


class Openapi extends StatefulWidget {
  const Openapi({super.key});

  @override
  State<Openapi> createState() => _OpenapiState();
}
class _OpenapiState extends State<Openapi> {
  var tbGitHubUser = TextEditingController();
  Map<String, dynamic>? userData;


  Future<void> fetchGitHubUser() async {
    try {
      var dio = Dio();
      final response = await dio.get('https://api.github.com/users/$username');
      setState(() {
        tbGitHubUser.text = response.data.toString();
        userData = response.data;
      });
      print("GitHub user data: ${response.data}");
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
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: fetchGitHubUser,
            child: const Text('Fetch GitHub User'),
          ),
          const SizedBox(height: 16),
          TextField(
              controller: tbGitHubUser,
              maxLines: 10,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'GitHub User Data',
                border: OutlineInputBorder(),
              ),
          ),
          const SizedBox(height: 16),
          userData == null
                ? const Text('No data')
                : Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      _buildTableRow('Login', userData!['login']),
                      _buildTableRow('Name', userData!['name']),
                      _buildTableRow('Company', userData!['company']),
                      _buildTableRow('Location', userData!['location']),
                      _buildTableRow('Public Repos', userData!['public_repos'].toString()),
                      _buildTableRow('Followers', userData!['followers'].toString()),
                      _buildTableRow('Following', userData!['following'].toString()),
                      // Add more fields as needed
                    ],
                  ),
        ],
      ),
    ),
  );
  }

 TableRow _buildTableRow(String key, dynamic value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(key, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value != null ? value.toString() : '-'),
        ),
      ],
    );
  }

}