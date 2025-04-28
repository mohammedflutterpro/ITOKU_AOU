import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:toku/Compononets/Info_widget.dart';
import 'package:toku/model/inner_data.dart';
import '../data/phrases_data.dart';
import '../services/flutter_tts_service.dart';

class Phrases extends StatelessWidget {
  const Phrases();

  // Convert Japanese to Romaji
  String convertToRomaji(String text) {
    final kanaKit = KanaKit();
    return kanaKit.toRomaji(text);
  }

  // Quiz dialog
  void _showQuizDialog(BuildContext context) {
    final randomPhrase = phrasesData[Random().nextInt(phrasesData.length)];
    final enPhrase = randomPhrase["EnName"]!;
    final japPhrase = randomPhrase["japName"]!;
    final romaji = convertToRomaji(japPhrase);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Phrase Quiz", style: TextStyle(color: Colors.blue)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(enPhrase, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("How do you say this in Japanese?", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => speakInJapanese(japPhrase),
              icon: Icon(Icons.volume_up),
              label: Text(romaji),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Updated to green for consistency
                foregroundColor: Colors.white,
              ),
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
        backgroundColor: Colors.blue,
        title: Text('Phrases', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.quiz, color: Colors.white),
            onPressed: () => _showQuizDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            mainAxisExtent: 100,
          ),
          itemCount: phrasesData.length,
          itemBuilder: (context, index) {
            final phraseColor = phrasesData[index]["color"] as Color;
            return GestureDetector(
              onTap: () {
                final japText = phrasesData[index]["japName"]!;
                final enText = phrasesData[index]["EnName"]!;
                final romaji = convertToRomaji(japText);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Center(
                      child: Text(
                        enText,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          japText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue[800],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 15),
                        if (phrasesData[index]["literalTranslation"] != null)
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              '"${phrasesData[index]["literalTranslation"]}"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        if (phrasesData[index]["culturalNote"] != null)
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              phrasesData[index]["culturalNote"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        SizedBox(height: 15),
                        // Button to play the Japanese audio
                        ElevatedButton.icon(
                          onPressed: () => speakInJapanese(japText),
                          icon: Icon(Icons.volume_up, size: 18),
                          label: Text(romaji),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Updated to green for consistency
                            foregroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Button to play the English audio
                        ElevatedButton.icon(
                          onPressed: () => speakInEnglish(enText),
                          icon: Icon(Icons.volume_up, size: 18),
                          label: Text(enText),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: phraseColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    phrasesData[index]["EnName"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _getContrastColor(phraseColor),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Ensure text is readable on any background color
  Color _getContrastColor(Color color) {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}