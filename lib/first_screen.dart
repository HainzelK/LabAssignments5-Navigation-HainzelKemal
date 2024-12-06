import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _controller = TextEditingController();
  int? numberOfPages;

  @override
  Widget build(BuildContext context) {
    final String receivedData =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'No Data Passed';

    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Data: $receivedData'),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter number of pages (max: 500)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  numberOfPages = int.tryParse(value);
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (numberOfPages != null && numberOfPages! > 0 && numberOfPages! <= 500) {
                  Navigator.pushNamed(
                    context,
                    '/dynamic_pages',
                    arguments: numberOfPages,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter a valid number between 1 and 500',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Generate Pages'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (int index) {
          final routes = ['/', '/second', '/third'];
          Navigator.pushNamedAndRemoveUntil(
            context,
            routes[index],
            (route) => false,
            arguments: 'Hello from First Screen',
          );
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.looks_one), label: 'First'),
          NavigationDestination(icon: Icon(Icons.looks_two), label: 'Second'),
          NavigationDestination(icon: Icon(Icons.looks_3), label: 'Third'),
        ],
      ),
    );
  }
}
