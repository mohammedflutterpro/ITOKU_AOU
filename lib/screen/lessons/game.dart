import 'package:flutter/material.dart';
import 'package:toku/services/flutter_tts_service.dart';
import 'dart:math';

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({Key? key}) : super(key: key);

  @override
  _QuizGamePageState createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  // List of characters and their romaji from Lesson1Page
  final List<Map<String, String>> characters = [
    {'japanese': 'あ', 'romaji': 'a'},
    {'japanese': 'い', 'romaji': 'i'},
    {'japanese': 'う', 'romaji': 'u'},
    {'japanese': 'え', 'romaji': 'e'},
    {'japanese': 'お', 'romaji': 'o'},
    {'japanese': 'か', 'romaji': 'ka'},
    {'japanese': 'き', 'romaji': 'ki'},
    {'japanese': 'く', 'romaji': 'ku'},
    {'japanese': 'ア', 'romaji': 'a'},
    {'japanese': 'イ', 'romaji': 'i'},
    {'japanese': 'ウ', 'romaji': 'u'},
    {'japanese': 'エ', 'romaji': 'e'},
    {'japanese': 'オ', 'romaji': 'o'},
    {'japanese': 'カ', 'romaji': 'ka'},
    {'japanese': 'キ', 'romaji': 'ki'},
  ];

  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;
  String feedback = '';
  late Map<String, String> currentCharacter;
  late List<String> options;

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _loadQuestion() {
    if (currentQuestion < 10) {
      // Randomly select a character
      currentCharacter = characters[Random().nextInt(characters.length)];
      // Generate options: 1 correct, 3 incorrect
      options = [currentCharacter['romaji']!];
      while (options.length < 4) {
        final randomCharacter = characters[Random().nextInt(characters.length)];
        if (!options.contains(randomCharacter['romaji']) &&
            randomCharacter['romaji'] != currentCharacter['romaji']) {
          options.add(randomCharacter['romaji']!);
        }
      }
      options.shuffle();
      // Reset state
      selectedAnswer = null;
      feedback = '';
      // Speak the character when the question loads
      speakInJapanese(currentCharacter['japanese']!);
      setState(() {});
    } else {
      // Show results
      _showResults();
    }
  }

  void _checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      if (answer == currentCharacter['romaji']) {
        score++;
        feedback = 'Correct!';
      } else {
        feedback = 'Wrong! The correct answer is ${currentCharacter['romaji']}.';
      }
    });

    // Move to next question after delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentQuestion++;
        _loadQuestion();
      });
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Complete!'),
        content: Text('Your score: $score/10'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to NewLessonsPage
            },
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Hiragana Quiz Game', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestion + 1}/10',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Repeat pronunciation when the card is tapped
                speakInJapanese(currentCharacter['japanese']!);
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    currentCharacter['japanese']!,
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              feedback,
              style: TextStyle(
                fontSize: 16,
                color: feedback.startsWith('Correct') ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: options.map((option) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: selectedAnswer == null
                        ? () => _checkAnswer(option)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}