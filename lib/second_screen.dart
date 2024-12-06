import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely receiving the argument and providing a default value
    final String receivedData = ModalRoute.of(context)?.settings.arguments as String? ?? 'No Data Passed';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
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
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false, arguments: 'Hello from Second Screen');
              },
              child: const Text('Go Back to First Screen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/third', (route) => false, arguments: 'Hello from Second Screen');
              },
              child: const Text("To Third Screen"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (int index) {
          final routes = ['/', '/second', '/third'];
          Navigator.pushNamedAndRemoveUntil(context, routes[index], (route) => false, arguments: 'Hello from Second Screen');
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
