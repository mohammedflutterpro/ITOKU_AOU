import 'package:flutter/material.dart';
import 'package:toku/services/flutter_tts_service.dart';

class Lesson2Page extends StatelessWidget {
  const Lesson2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Lesson 2: Common Phrases', style: TextStyle(color: Colors.white)),
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
                'Daily Conversation Phrases',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Learn these common phrases to use in everyday conversations in Japanese.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              _buildPhraseCard(
                context,
                'Hello',
                'こんにちは (Konnichiwa)',
                'こんにちは',
                'Konnichiwa',
              ),
              _buildPhraseCard(
                context,
                'Good morning',
                'おはよう (Ohayou)',
                'おはよう',
                'Ohayou',
              ),
              _buildPhraseCard(
                context,
                'Good evening',
                'こんばんは (Konbanwa)',
                'こんばんは',
                'Konbanwa',
              ),
              _buildPhraseCard(
                context,
                'Thank you',
                'ありがとう (Arigatou)',
                'ありがとう',
                'Arigatou',
              ),
              _buildPhraseCard(
                context,
                'Excuse me / Sorry',
                'すみません (Sumimasen)',
                'すみません',
                'Sumimasen',
              ),
              _buildPhraseCard(
                context,
                'Please',
                'おねがいします (Onegaishimasu)',
                'おねがいします',
                'Onegaishimasu',
              ),
              _buildPhraseCard(
                context,
                'Goodbye',
                'じゃあね (Jaa ne)',
                'じゃあね',
                'Jaa ne',
              ),
              _buildPhraseCard(
                context,
                'See you later',
                'またね (Mata ne)',
                'またね',
                'Mata ne',
              ),
              _buildPhraseCard(
                context,
                'Nice to meet you',
                'はじめまして (Hajimemashite)',
                'はじめまして',
                'Hajimemashite',
              ),
              _buildPhraseCard(
                context,
                'How are you?',
                'げんき？ (Genki?)',
                'げんき？',
                'Genki?',
              ),
              _buildPhraseCard(
                context,
                'I’m fine',
                'げんきです (Genki desu)',
                'げんきです',
                'Genki desu',
              ),
              _buildPhraseCard(
                context,
                'What’s your name?',
                'なまえは？ (Namae wa?)',
                'なまえは？',
                'Namae wa?',
              ),
              _buildPhraseCard(
                context,
                'My name is…',
                'わたしのなまえは… ',
                'わたしのなまえは…',
                'Watashi no namae wa…',
              ),
              _buildPhraseCard(
                context,
                'I don’t understand',
                'わかりません (Wakarimasen)',
                'わかりません',
                'Wakarimasen',
              ),
              _buildPhraseCard(
                context,
                'Thank you very much',
                'どうもありがとう ',
                'どうもありがとう',
                'Doumo arigatou',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhraseCard(
      BuildContext context,
      String english,
      String japanese,
      String japaneseText,
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
                speakInJapanese(japaneseText); // Speak the Japanese phrase
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