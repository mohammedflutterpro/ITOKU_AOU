import 'package:flutter/material.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

import '../data/colors_data.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  // Function to translate and speak the word
  void translateAndSpeak(String text) async {
    try {
      // Translate the text to Japanese
      var translation = await translator.translate(text, to: 'ja');

      // Set language to Japanese
      await flutterTts.setLanguage("ja-JP");
      await flutterTts.setSpeechRate(0.4); // Adjust speed if necessary
      await flutterTts.speak(translation.text); // Speak the translated word
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: double.maxFinite,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Colors',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns in the grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: colorsData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Center(
                        child: Text(
                          colorsData[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Display the color
                          Container(
                            width: 100,
                            height: 100,
                            color: colorsData[index]["color"], // Display the color directly
                          ),
                          SizedBox(height: 10),
                          // Display the Japanese name (romaji)
                          Text(
                            colorsData[index]["japName"]!, // Romaji name
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      actions: [
                        // Button to play the Japanese pronunciation
                        TextButton.icon(
                          onPressed: () {
                            translateAndSpeak(colorsData[index]["EnName"]!);
                          },
                          icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                          label: Text(
                            'Japanese',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                        // Close button
                        TextButton(
                          child: Text(
                            'close',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 100, // Fixed width for square shape
                height: 100, // Fixed height for square shape
                decoration: BoxDecoration(
                  color: colorsData[index]["color"], // Set the color
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    // Text with black stroke
                    Text(
                      colorsData[index]["EnName"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = Colors.black,
                      ),
                    ),
                    // Text with white color
                    Text(
                      colorsData[index]["EnName"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
