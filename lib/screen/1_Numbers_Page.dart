import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:toku/data/numbers_data.dart';

class NumbersPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  NumbersPage({super.key});

  Future<void> _speakNumber(String text, {bool isTranslation = false}) async {
    await flutterTts.setLanguage(isTranslation ? "ja-JP" : "en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  // Quiz dialog
  void _showQuizDialog(BuildContext context) {
    final randomNumber = (1 + Random().nextInt(50)).toString();
    final romaji = romajiNumbers(int.parse(randomNumber));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quiz Time!", style: TextStyle(color: Colors.blue)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("How do you say '$randomNumber' in Japanese?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Reveal Answer"),
              onPressed: () {
                _speakNumber(romaji, isTranslation: true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Answer: $romaji")),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Close"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.quiz, color: Colors.white),
            onPressed: () => _showQuizDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 50,
          itemBuilder: (context, index) {
            final number = index + 1;
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Center(
                      child: Text('$number', style: TextStyle(fontSize: 50)),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          romajiNumbers(number),
                          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        if (number == 4 || number == 7 || number == 9)
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              number == 4
                                  ? "Note: 'Shi' (4) sounds like 'death'"
                                  : number == 7
                                  ? "Note: Can also be 'shichi'"
                                  : "Note: 'Ku' (9) sounds like 'suffering'",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        SizedBox(height: 10),
                        // Button to play the English audio
                        ElevatedButton.icon(
                          onPressed: () {
                            _speakNumber('$number'); // Play English audio
                          },
                          icon: Icon(Icons.volume_up),
                          label: Text('$number'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Button to play the Japanese audio
                        ElevatedButton.icon(
                          onPressed: () {
                            _speakNumber(romajiNumbers(number), isTranslation: true); // Play Japanese audio
                          },
                          icon: Icon(Icons.volume_up),
                          label: Text(romajiNumbers(number)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Center(
                        child: TextButton(
                          child: Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _getNumberColor(number),
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

  // Color coding by number groups
  Color _getNumberColor(int number) {
    if (number <= 10) return Colors.blue;
    if (number <= 20) return Colors.green;
    if (number <= 30) return Colors.orange;
    if (number <= 40) return Colors.purple;
    return Colors.red;
  }
}