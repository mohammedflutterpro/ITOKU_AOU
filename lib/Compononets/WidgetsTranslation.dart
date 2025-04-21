import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TranslationDialog {
  static void show({
    required BuildContext context,
    required String originalText,
    required String translatedText,
    required String romaji,
    required FlutterTts flutterTts,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Japanese Pronunciation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("English words:"),
            Text(
              originalText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Japanese Translation:"),
            Text(
              translatedText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Pronunciation (Romaji):"),
            Text(
              romaji,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () {
              flutterTts.setLanguage('ja-JP');
              flutterTts.setSpeechRate(0.5);
              flutterTts.speak(translatedText);
            },
            child: Text('Listen in Japanese'),
          ),
        ],
      ),
    );
  }
}
