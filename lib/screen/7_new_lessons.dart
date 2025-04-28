import 'package:flutter/material.dart';

class NewLessonsPage extends StatelessWidget {
  const NewLessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('New Lessons', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to New Lessons!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Explore new and exciting lessons to enhance your Japanese learning.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            _buildLessonCard('Lesson 1: Japanese Basics', 'Introduction to Hiragana and Katakana'),
            _buildLessonCard('Lesson 2: Common Phrases', 'Learn daily conversation phrases'),
            _buildLessonCard('Lesson 3: Numbers and Counting', 'Master the Japanese number system'),
          ],
        ),
      ),
    );
  }

  // بناء عنصر درس فردي
  Widget _buildLessonCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // يمكنك إضافة إجراءات هنا عند الضغط على الدرس
        },
      ),
    );
  }


}
