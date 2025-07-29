import 'package:flutter/material.dart';

class ScrollViewExample extends StatelessWidget {
  const ScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollView & Touch Example')),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue[700]),
                    title: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Title of item $index tapped')),
                        );
                      },
                      child: Text('User $index'),
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Subtitle of item $index tapped')),
                        );
                      },
                      child: Text('Subtitle for user $index'),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    // Optionally, keep the whole tile tap as well:
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item $index tapped')),
                      );
                    },
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}