import 'package:flutter/material.dart';

import '../data/phrases_data.dart'; // Import the data file

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Phrases',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: phrasesData.length,
        itemBuilder: (context, index) {
          final phrase = phrasesData[index];
          return ListTile(
            title: Text(phrase['EnName']),
            subtitle: Text(phrase['japName']),
            tileColor: phrase['color'], // Set the color
            onTap: () {
              // Handle tap (e.g., play sound)
            },
          );
        },
      ),
    );
  }
}
