import 'package:flutter/material.dart';

class GeneratedPage extends StatelessWidget {
  final int pageNumber;
  final int totalPages;

  const GeneratedPage({
    super.key,
    required this.pageNumber,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $pageNumber'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Page $pageNumber',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('Back to First Screen'),
            ),
            const SizedBox(height: 20),
            if (pageNumber < totalPages)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratedPage(
                        pageNumber: pageNumber + 1,
                        totalPages: totalPages,
                      ),
                    ),
                  );
                },
                child: Text('Go to Page ${pageNumber + 1}'),
              ),
            if (pageNumber > 1)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratedPage(
                        pageNumber: pageNumber - 1,
                        totalPages: totalPages,
                      ),
                    ),
                  );
                },
                child: Text('Go to Page ${pageNumber - 1}'),
              ),
          ],
        ),
      ),
    );
  }
}
