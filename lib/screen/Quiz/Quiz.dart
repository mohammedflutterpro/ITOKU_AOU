import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../model/Question_class.dart';  // تأكد أن الملف موجود في هذا المسار
import 'QuestionWidget.dart';
import 'ReviewPage.dart';
import 'dart:math';  // لإضافة Random لاختيار الأسئلة عشوائيًا

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  FlutterTts _flutterTts = FlutterTts();
  late List<Question> questions;
  List<String?> userAnswers = [];
  Random _random = Random();  // لإنشاء مولد أرقام عشوائية

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
    questions = _generateRandomQuestions();
    userAnswers = List.filled(questions.length, null);
  }

  List<Question> _generateRandomQuestions() {
    final allQuestions = [
      Question(
        questionText: 'What is the Japanese for "Good morning"?',
        type: QuestionType.multipleChoice,
        options: ['Konnichiwa', 'Ohayou gozaimasu', 'Konbanwa', 'Oyasumi nasai'],
        correctAnswer: 'Ohayou gozaimasu',
      ),
      Question(
        questionText: 'How do you say "thank you" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Arigatou', 'Konnichiwa', 'Sayonara', 'Sumimasen'],
        correctAnswer: 'Arigatou',
      ),
      Question(
        questionText: 'Fill in the blank: "I am a student" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Watashi wa gakusei desu',
      ),
      Question(
        questionText: 'What is the Japanese word for "cat"?',
        type: QuestionType.multipleChoice,
        options: ['Inu', 'Neko', 'Tori', 'Umi'],
        correctAnswer: 'Neko',
      ),
      Question(
        questionText: 'How do you say "good night" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Oyasumi nasai', 'Konnichiwa', 'Sayonara', 'Arigatou'],
        correctAnswer: 'Oyasumi nasai',
      ),
      Question(
        questionText: 'What is the Japanese for "Goodbye"?',
        type: QuestionType.multipleChoice,
        options: ['Arigatou', 'Sayonara', 'Konnichiwa', 'Ohayou'],
        correctAnswer: 'Sayonara',
      ),
      Question(
        questionText: 'Fill in the blank: "My name is __" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Watashi no namae wa __ desu',
      ),
      Question(
        questionText: 'What is the Japanese word for "dog"?',
        type: QuestionType.multipleChoice,
        options: ['Inu', 'Neko', 'Tori', 'Nezumi'],
        correctAnswer: 'Inu',
      ),
      Question(
        questionText: 'How do you say "I love you" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Aishiteru', 'Konnichiwa', 'Arigatou', 'Sayonara'],
        correctAnswer: 'Aishiteru',
      ),
      Question(
        questionText: 'What is the Japanese for "apple"?',
        type: QuestionType.multipleChoice,
        options: ['Momo', 'Ringo', 'Yama', 'Sakana'],
        correctAnswer: 'Ringo',
      ),
      Question(
        questionText: 'Fill in the blank: "I am hungry" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Onaka ga suita',
      ),
      Question(
        questionText: 'What is the Japanese word for "fish"?',
        type: QuestionType.multipleChoice,
        options: ['Sakana', 'Inu', 'Tori', 'Umi'],
        correctAnswer: 'Sakana',
      ),
      Question(
        questionText: 'How do you say "excuse me" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Sumimasen', 'Arigatou', 'Konnichiwa', 'Sayonara'],
        correctAnswer: 'Sumimasen',
      ),
      Question(
        questionText: 'What is the Japanese word for "friend"?',
        type: QuestionType.multipleChoice,
        options: ['Tomodachi', 'Kare', 'Gakusei', 'Sensei'],
        correctAnswer: 'Tomodachi',
      ),
      Question(
        questionText: 'How do you say "sorry" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Sumimasen', 'Gomen nasai', 'Arigatou', 'Sayonara'],
        correctAnswer: 'Gomen nasai',
      ),
      Question(
        questionText: 'What is the Japanese word for "house"?',
        type: QuestionType.multipleChoice,
        options: ['Uchi', 'Kura', 'Kaze', 'Kumo'],
        correctAnswer: 'Uchi',
      ),
      Question(
        questionText: 'Fill in the blank: "Good morning" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Ohayou gozaimasu',
      ),
      Question(
        questionText: 'How do you say "goodbye" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Sayonara', 'Konnichiwa', 'Arigatou', 'Oyasumi nasai'],
        correctAnswer: 'Sayonara',
      ),
      Question(
        questionText: 'What is the Japanese word for "sun"?',
        type: QuestionType.multipleChoice,
        options: ['Taiyo', 'Kage', 'Umi', 'Kawa'],
        correctAnswer: 'Taiyo',
      ),
      Question(
        questionText: 'What is the Japanese word for "moon"?',
        type: QuestionType.multipleChoice,
        options: ['Tsuki', 'Hi', 'Kawa', 'Yama'],
        correctAnswer: 'Tsuki',
      ),
      Question(
        questionText: 'How do you say "Please" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Onegaishimasu', 'Arigatou', 'Sayonara', 'Sumimasen'],
        correctAnswer: 'Onegaishimasu',
      ),
      Question(
        questionText: 'What is the Japanese word for "school"?',
        type: QuestionType.multipleChoice,
        options: ['Gakkou', 'Uchi', 'Tori', 'Neko'],
        correctAnswer: 'Gakkou',
      ),
      Question(
        questionText: 'Fill in the blank: "I am fine" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Genki desu',
      ),
      Question(
        questionText: 'What is the Japanese word for "water"?',
        type: QuestionType.multipleChoice,
        options: ['Mizu', 'Ame', 'Sakana', 'Yama'],
        correctAnswer: 'Mizu',
      ),
      Question(
        questionText: 'How do you say "I do not understand" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Wakarimasen', 'Arigatou', 'Sayonara', 'Sumimasen'],
        correctAnswer: 'Wakarimasen',
      ),
      Question(
        questionText: 'What is the Japanese word for "book"?',
        type: QuestionType.multipleChoice,
        options: ['Hon', 'Tori', 'Inu', 'Sakana'],
        correctAnswer: 'Hon',
      ),
      Question(
        questionText: 'What is the Japanese word for "mountain"?',
        type: QuestionType.multipleChoice,
        options: ['Yama', 'Umi', 'Sakana', 'Kawa'],
        correctAnswer: 'Yama',
      ),
      Question(
        questionText: 'Fill in the blank: "I am sorry" in Japanese: ______________',
        type: QuestionType.fillInTheBlank,
        correctAnswer: 'Gomen nasai',
      ),
      Question(
        questionText: 'How do you say "What is your name?" in Japanese?',
        type: QuestionType.multipleChoice,
        options: ['Anata no namae wa nan desu ka?', 'Watashi wa gakusei desu', 'Konnichiwa', 'Arigatou'],
        correctAnswer: 'Anata no namae wa nan desu ka?',
      ),
    ];

    // اختيار 5 أسئلة عشوائيًا من القائمة
    List<Question> randomQuestions = [];
    while (randomQuestions.length < 5) {
      Question randomQuestion = allQuestions[_random.nextInt(allQuestions.length)];
      if (!randomQuestions.contains(randomQuestion)) {
        randomQuestions.add(randomQuestion);
      }
    }
    return randomQuestions;
  }

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

  void _restartQuiz() {
    setState(() {
      _initializeQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese Quiz'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _restartQuiz,
            tooltip: 'New Quiz',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'No time limit, answer at your pace!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                  speak: (text) => _flutterTts.speak(text),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _submitQuiz,
              child: Text('Submit Quiz'),
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
