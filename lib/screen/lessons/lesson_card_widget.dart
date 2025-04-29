import 'package:flutter/material.dart';
import 'package:toku/services/flutter_tts_service.dart';

Widget buildCharacterCard(
    BuildContext context,
    String title,
    String description,
    String japanese,
    String romaji,
    ) {
  return Card(
    margin: const EdgeInsets.only(bottom: 16),
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              speakInJapanese(japanese);
              speakInJapanese(romaji);
            },
            icon: const Icon(Icons.volume_up, color: Colors.white),
            label: const Text('Speak', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    ),
  );
}
