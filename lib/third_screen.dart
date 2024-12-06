import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely receiving the argument and providing a default value
    final String receivedData = ModalRoute.of(context)?.settings.arguments as String? ?? 'No Data Passed';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Always go to the first screen
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Data: $receivedData'), // Display received argument
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false, arguments: 'Hello from Third Screen');
              },
              child: const Text('Go Back to First Screen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/second', (route) => false, arguments: 'Hello from Third Screen');
              },
              child: const Text("To Second Screen"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (int index) {
          final routes = ['/', '/second', '/third'];
          Navigator.pushNamedAndRemoveUntil(context, routes[index], (route) => false, arguments: 'Hello from Third Screen');
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
