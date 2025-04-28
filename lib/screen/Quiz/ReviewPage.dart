import 'package:flutter/material.dart';

import '../../model/Question_class.dart';

class ReviewPage extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  const ReviewPage({required this.questions, required this.userAnswers});

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i]?.toLowerCase() == questions[i].correctAnswer.toLowerCase()) {
        correctAnswers++;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Quiz Results')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Score: $correctAnswers/${questions.length}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final userAnswer = userAnswers[index];
                final isCorrect = userAnswer?.toLowerCase() == question.correctAnswer.toLowerCase();

                return Card(
                  margin: EdgeInsets.all(8.0),
                  color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.questionText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Your answer: ${userAnswer ?? "No answer"}'),
                        Text('Correct answer: ${question.correctAnswer}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Try Again'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
