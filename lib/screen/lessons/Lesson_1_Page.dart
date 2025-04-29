import 'package:flutter/material.dart';
import 'package:toku/screen/lessons/lesson_card_widget.dart';

class Lesson1Page extends StatelessWidget {
  const Lesson1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Lesson 1: Japanese Basics', style: TextStyle(color: Colors.white)),
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
                'Introduction to Hiragana and Katakana',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hiragana and Katakana are two of the Japanese writing systems. Hiragana is used for native words, while Katakana is used for foreign words and emphasis. Below are a few basic characters.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              buildCharacterCard(context, 'あ (a)', 'Hiragana "a"', 'あ', 'a'),
              buildCharacterCard(context, 'い (i)', 'Hiragana "i"', 'い', 'i'),
              buildCharacterCard(context, 'う (u)', 'Hiragana "u"', 'う', 'u'),
              buildCharacterCard(context, 'え (e)', 'Hiragana "e"', 'え', 'e'),
              buildCharacterCard(context, 'お (o)', 'Hiragana "o"', 'お', 'o'),
              buildCharacterCard(context, 'か (ka)', 'Hiragana "ka"', 'か', 'ka'),
              buildCharacterCard(context, 'き (ki)', 'Hiragana "ki"', 'き', 'ki'),
              buildCharacterCard(context, 'く (ku)', 'Hiragana "ku"', 'く', 'ku'),
              buildCharacterCard(context, 'ア (a)', 'Katakana "a"', 'ア', 'a'),
              buildCharacterCard(context, 'イ (i)', 'Katakana "i"', 'イ', 'i'),
              buildCharacterCard(context, 'ウ (u)', 'Katakana "u"', 'ウ', 'u'),
              buildCharacterCard(context, 'エ (e)', 'Katakana "e"', 'エ', 'e'),
              buildCharacterCard(context, 'オ (o)', 'Katakana "o"', 'オ', 'o'),
              buildCharacterCard(context, 'カ (ka)', 'Katakana "ka"', 'カ', 'ka'),
              buildCharacterCard(context, 'キ (ki)', 'Katakana "ki"', 'キ', 'ki'),
            ],
          ),
        ),
      ),
    );
  }
}
