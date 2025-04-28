import 'package:flutter/material.dart';
import 'package:toku/model/Question_class.dart';


class QuestionWidget extends StatelessWidget {
  final Question question;
  final String? groupValue;
  final Function(String) onAnswerSelected;
  final Function(String) speak;

  const QuestionWidget({
    required this.question,
    required this.groupValue,
    required this.onAnswerSelected,
    required this.speak,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    question.questionText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.volume_up),
                  onPressed: () => speak(question.questionText),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (question.type == QuestionType.multipleChoice)
              ...question.options!.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: groupValue,
                  onChanged: (value) => onAnswerSelected(value!),
                );
              }).toList(),
            if (question.type == QuestionType.fillInTheBlank)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your answer',
                  border: OutlineInputBorder(),
                ),
                onChanged: onAnswerSelected,
              ),
          ],
        ),
      ),
    );
  }
}
