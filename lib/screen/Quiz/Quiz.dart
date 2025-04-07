import 'package:flutter/material.dart';
import 'package:toku/model/Quiz_model.dart';
import 'package:toku/screen/Quiz/ReviewPage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [
    Question(
      questionText: 'Nihon no shuto wa doko desu ka?', // What is the capital of Japan?
      type: QuestionType.multipleChoice,
      options: ['Tokyo', 'Kyoto', 'Osaka', 'Sapporo'], // Tokyo, Kyoto, Osaka, Sapporo
      correctAnswer: 'Tokyo', // Tokyo
    ),
    Question(
      questionText: 'Kuuhaku wo umete kudasai: Nihon no kokugo wa _ desu.', // Fill in the blank: The national language of Japan is _.
      type: QuestionType.fillInTheBlank,
      correctAnswer: 'Nihongo', // Japanese
    ),


    Question(
      questionText: 'Aka to ao wo mazeru to nani iro ni narimasu ka?', // What color do you get when you mix red and blue?
      type: QuestionType.multipleChoice,
      options: ['Midori', 'Murasaki', 'Orenji', 'Kiiro'], // Green, Purple, Orange, Yellow
      correctAnswer: 'Murasaki', // Purple
    ),
    Question(
      questionText: 'Kuuhaku wo umete kudasai: Sora no iro wa _ desu.', // Fill in the blank: The color of the sky is _.
      type: QuestionType.fillInTheBlank,
      correctAnswer: 'ao', // Blue
    ),

    // New quizzes about family members (in Romaji)
    Question(
      questionText: 'Chichi no ane wa nanto yobimasu ka?', // What do you call your father's sister?
      type: QuestionType.multipleChoice,
      options: ['Oba', 'Oji', 'Itoko', 'Ane'], // Aunt, Uncle, Cousin, Sister
      correctAnswer: 'Oba', // Aunt
    ),
    Question(
      questionText: 'Kuuhaku wo umete kudasai: Hahaoya to chichioya wa _ desu.', // Fill in the blank: Your mother and father are your _.
      type: QuestionType.fillInTheBlank,
      correctAnswer: 'ryoushin', // Parents
    ),

    // New quizzes about numbers (in Romaji)
    Question(
      questionText: 'Juuni tasu juugo wa ikutsu desu ka?', // What is 12 + 15?
      type: QuestionType.multipleChoice,
      options: ['Nijuu', 'Nijuugo', 'Sanjuu', 'Sanjuugo'], // 20, 25, 30, 35
      correctAnswer: 'Nijuugo', // 25
    ),
    Question(
      questionText: 'Kuuhaku wo umete kudasai: Kyuu no tsugi no kazu wa _ desu.', // Fill in the blank: The number after 9 is _.
      type: QuestionType.fillInTheBlank,
      correctAnswer: 'juu', // 10
    ),
  ];

  // Initialize userAnswers dynamically based on the number of questions
  List<String?> userAnswers = List.filled(8, null); // Updated to match the number of questions

  void _submitQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewPage(
          questions: questions,
          userAnswers: userAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')), // Quiz in Romaji
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            question: questions[index],
            groupValue: userAnswers[index],
            onAnswerSelected: (answer) {
              setState(() {
                userAnswers[index] = answer;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitQuiz,
        child: Icon(Icons.done),
        tooltip: 'Kuizu wo teishutsu', // Submit Quiz in Romaji
      ),
    );
  }
}

enum QuestionType { multipleChoice, fillInTheBlank }

