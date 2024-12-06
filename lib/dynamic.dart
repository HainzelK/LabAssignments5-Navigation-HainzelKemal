import 'package:flutter/material.dart';
import 'generated.dart';

class DynamicPagesScreen extends StatelessWidget {
  const DynamicPagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int numberOfPages =
        ModalRoute.of(context)?.settings.arguments as int? ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Pages'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: numberOfPages,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('Page ${index + 1}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratedPage(
                        pageNumber: index + 1,
                        totalPages: numberOfPages,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
