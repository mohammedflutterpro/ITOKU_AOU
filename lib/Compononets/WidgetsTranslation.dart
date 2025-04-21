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
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFDFDFD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Translation Result',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.teal,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("ُEnglish:", originalText),
            const SizedBox(height: 8),
            _buildRow("Japanese:", translatedText),
            const SizedBox(height: 8),
            _buildRow("Romaji:", romaji),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await flutterTts.setLanguage("ja-JP");
              await flutterTts.speak(translatedText);
            },
            child: const Text(
              "🔊 Listen",
              style: TextStyle(color: Colors.teal),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        children: [
          TextSpan(
            text: "$label ",
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
