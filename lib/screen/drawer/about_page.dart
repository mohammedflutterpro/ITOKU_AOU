import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Itoku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'About Itoku',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Itoku is a simple and fun educational app designed for kids and teens aged 6 to 18 to learn the Japanese language. '
                    'We offer an interactive experience with pictures, sounds, and easy lessons to help users learn basic Japanese words and phrases in a fun and engaging way.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'App Features:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Various lessons to teach pronunciation and meanings.'),
              Text('• Speech feature: Speak in English and the app translates it to Japanese and reads it aloud.'),
              Text('• Simple quizzes with multiple-choice and fill-in-the-blank questions to test progress.'),
              Text('• Tutor feature to guide users through learning.'),
              Text('• Admin panel for managing accounts and content.'),
              SizedBox(height: 16),
              Text(
                'Technologies Used:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Flutter framework'),
              Text('• speech_to_text'),
              Text('• flutter_tts'),
              Text('• translator'),
              Text('• kana_kit'),
              Text('• SharedPreferences'),
              SizedBox(height: 16),
              Text(
                'System Requirements:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Android 8.0 or higher'),
              Text('• Minimum 4GB RAM'),
              SizedBox(height: 24),
              Text(
                'Our goal is to make learning Japanese easy and enjoyable for anyone who loves anime or wants to explore a new language.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
