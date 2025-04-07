import 'package:flutter/material.dart';
import 'package:toku/model/Quiz_model.dart';

class ReviewPage extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  ReviewPage({
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Review')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswer = userAnswers[index];
          final isCorrect = userAnswer == question.correctAnswer;

          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(question.questionText),
                  SizedBox(height: 8),
                  Text('Your Answer: $userAnswer'),
                  Text('Correct Answer: ${question.correctAnswer}'),
                  Text(isCorrect ? 'Correct!' : 'Incorrect'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
