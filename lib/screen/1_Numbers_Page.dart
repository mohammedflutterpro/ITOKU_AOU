import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../data/numbers_data.dart';

class NumbersPage extends StatelessWidget {
  NumbersPage({super.key});

  final FlutterTts flutterTts = FlutterTts();
  void showNumberDialog(BuildContext context, int number) {
    String romaji = japaneseNumbersRomaji[number - 1];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: Text(
              '$number',
              style: TextStyle(fontSize: 50),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                romaji,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton.icon(
              onPressed: () async {
                await flutterTts.setLanguage("ja-JP");
                await flutterTts.setSpeechRate(0.4);
                await flutterTts.speak(romaji);
              },
              icon: Icon(Icons.volume_up, color: Colors.blue),
              label: Text(
                'japanese ',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
              child: Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Numbers',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 100,
          itemBuilder: (context, index) {
            int number = index + 1;
            return GestureDetector(
              onTap: () {
                showNumberDialog(context, number);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
