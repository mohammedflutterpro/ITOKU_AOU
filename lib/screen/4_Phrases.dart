import 'package:flutter/material.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

import '../data/phrases_data.dart';

class Phrases extends StatelessWidget {
   Phrases();

  final FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  // Function to translate and speak the phrase
  void translateAndSpeak(String text) async {
    try {
      // Translate the text to Japanese
      var translation = await translator.translate(text, to: 'ja');

      // Set language to Japanese
      await flutterTts.setLanguage("ja-JP");
      await flutterTts.setSpeechRate(0.4); // Adjust speed if necessary
      await flutterTts.speak(translation.text); // Speak the translated phrase
    } catch (e) {
      print("Error: $e");
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns in the grid
            mainAxisSpacing: 10,
            mainAxisExtent: 100,
          ),
          itemCount: phrasesData.length,
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
                          phrasesData[index]["EnName"]!,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),
                          // Display the Japanese phrase (romaji)
                          Text(
                            phrasesData[index]["japName"]!, // Romaji name
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      actions: [
                        // Button to play the Japanese pronunciation
                        TextButton.icon(
                          onPressed: () {
                            translateAndSpeak(phrasesData[index]["EnName"]!);
                          },
                          icon: Icon(Icons.volume_up, color: Colors.blue),
                          label: Text(
                            'Japanese',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        // Close button
                        TextButton(
                          child: Text(
                            'إغلاق',
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
                decoration: BoxDecoration(
                  color: phrasesData[index]["color"], // Set the color
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  phrasesData[index]["EnName"]!, // Display English phrase name
                  style: TextStyle(
                    fontSize: 16,
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
