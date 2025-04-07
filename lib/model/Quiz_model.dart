import 'package:flutter/material.dart';
import 'package:toku/screen/Quiz/Quiz.dart';

class Question {
  final String questionText;
  final QuestionType type;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.type,
    required this.correctAnswer,
    this.options = const [],
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final String? groupValue;
  final Function(String) onAnswerSelected;

  QuestionWidget({
    required this.question,
    required this.groupValue,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (question.type == QuestionType.multipleChoice) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.questionText),
            ...question.options.map(
                  (option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: groupValue,
                onChanged: (value) {
                  onAnswerSelected(value!);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.questionText),
            TextField(
              onChanged: (text) {
                onAnswerSelected(text);
              },
              decoration: InputDecoration(hintText: 'Kotae wo nyuuryoku'), // Enter your answer in Romaji
            ),
          ],
        ),
      );
    }
  }
}