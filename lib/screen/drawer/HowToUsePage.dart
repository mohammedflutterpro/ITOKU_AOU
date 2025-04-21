import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Use'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'How to Use Itoku',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Follow these simple steps to get started with Itoku:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Choose a Lesson:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Pick a lesson based on your level. Each lesson includes words, pictures, and pronunciation.',
              ),
              SizedBox(height: 12),
              Text(
                '2. Use the Microphone Button:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Tap the microphone icon, speak in English, and get the Japanese translation with pronunciation.',
              ),
              SizedBox(height: 12),
              Text(
                '3. Take a Quiz:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'After completing a lesson, test yourself using fun quizzes. Choose the correct answer or fill in the blanks.',
              ),
              SizedBox(height: 12),
              Text(
                '4. Review Your Progress:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'At the end of each quiz, you’ll see your total score. Use it to track your improvement.',
              ),
              SizedBox(height: 12),
              Text(
                '5. Get Help from the Tutor:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'If you’re stuck or need help, the tutor feature will guide you through the content.',
              ),
              SizedBox(height: 24),
              Text(
                'Enjoy learning Japanese with Itoku and have fun!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
