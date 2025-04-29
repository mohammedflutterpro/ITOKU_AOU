import 'package:flutter/material.dart';
import 'package:toku/services/flutter_tts_service.dart';

class Lesson3Page extends StatelessWidget {
  const Lesson3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Lesson 3: Numbers and Counting', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Japanese Numbers (1–10)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Learn how to count from 1 to 10 in Japanese, including kanji and romaji.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              _buildNumberCard(
                context,
                'One',
                '一 (Ichi)',
                '一',
                'Ichi',
              ),
              _buildNumberCard(
                context,
                'Two',
                '二 (Ni)',
                '二',
                'Ni',
              ),
              _buildNumberCard(
                context,
                'Three',
                '三 (San)',
                '三',
                'San',
              ),
              _buildNumberCard(
                context,
                'Four',
                '四 (Shi/Yon)',
                '四',
                'Yon',
              ),
              _buildNumberCard(
                context,
                'Five',
                '五 (Go)',
                '五',
                'Go',
              ),
              _buildNumberCard(
                context,
                'Six',
                '六 (Roku)',
                '六',
                'Roku',
              ),
              _buildNumberCard(
                context,
                'Seven',
                '七 (Shichi/Nana)',
                '七',
                'Nana',
              ),
              _buildNumberCard(
                context,
                'Eight',
                '八 (Hachi)',
                '八',
                'Hachi',
              ),
              _buildNumberCard(
                context,
                'Nine',
                '九 (Kyuu/Ku)',
                '九',
                'Kyuu',
              ),
              _buildNumberCard(
                context,
                'Ten',
                '十 (Juu)',
                '十',
                'Juu',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberCard(
      BuildContext context,
      String english,
      String japanese,
      String kanji,
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
                  english,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  japanese,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                speakInJapanese(kanji); // Speak the kanji reading
                speakInJapanese(romaji); // Speak the romaji with Japanese accent
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
}