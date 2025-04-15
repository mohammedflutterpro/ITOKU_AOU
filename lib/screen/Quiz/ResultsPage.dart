import 'package:flutter/material.dart';
import 'package:toku/model/Quiz_model.dart';

class ResultsPage extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  const ResultsPage({
    Key? key,
    required this.questions,
    required this.userAnswers,
  }) : super(key: key);

  // Calculate the score
  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();
    int totalQuestions = questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the score
            Text(
              'Your Score: $score/$totalQuestions',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Review Your Answers:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // List of questions with user answers and correct answers
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  bool isCorrect =
                      userAnswers[index] == questions[index].correctAnswer;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question text
                          Text(
                            'Q${index + 1}: ${questions[index].questionText}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // User's answer
                          Row(
                            children: [
                              const Text(
                                'Your Answer: ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                userAnswers[index] ?? 'Not answered',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isCorrect ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Correct answer
                          Row(
                            children: [
                              const Text(
                                'Correct Answer: ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                questions[index].correctAnswer,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}