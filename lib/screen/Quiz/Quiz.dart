import 'package:flutter/material.dart';
import 'dart:math';
import 'package:toku/model/Quiz_model.dart';
import 'package:toku/screen/Quiz/ResultsPage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  List<String?> userAnswers = List.filled(12, null);
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    questions = generateQuestions();
  }

  List<Question> generateQuestions() {
    final familyData = [
      {"EnName": "Father", "japName": "Otousan"},
      {"EnName": "Mother", "japName": "Okaasan"},
      {"EnName": "Brother", "japName": "Ani"},
      {"EnName": "Sister", "japName": "Imouto"},
      {"EnName": "Grandfather", "japName": "Ojiisan"},
    ];
    final colorsData = [
      {"EnName": "Blue", "japName": "Aoi"},
      {"EnName": "Red", "japName": "Aka"},
      {"EnName": "Green", "japName": "Midori"},
      {"EnName": "Yellow", "japName": "Kiiro"},
      {"EnName": "Purple", "japName": "Murasaki"},
    ];
    final phrasesData = [
      {"EnName": "Good morning", "japName": "Ohayou gozaimasu"},
      {"EnName": "Thank you", "japName": "Arigatou"},
      {"EnName": "I'm sorry", "japName": "Gomen nasai"},
      {"EnName": "You're welcome", "japName": "Douitashimashite"},
    ];
    final numbersData = [
      'ichi', 'ni', 'san', 'yon', 'go', 'roku', 'nana', 'hachi', 'kyuu', 'juu'
    ];
    final foodData = [
      {"EnName": "Rice", "japName": "gohan"},
      {"EnName": "Sushi", "japName": "sushi"},
      {"EnName": "Ramen", "japName": "ramen"},
      {"EnName": "Tempura", "japName": "tenpura"},
    ];

    List<Question> newQuestions = [];

    List<String> getShuffledOptions(String correct, List<String> others) {
      int availableOptions = others.length;
      int optionsToTake = min(3, availableOptions);
      List<String> options = [correct];
      if (optionsToTake > 0) {
        options.addAll(others.sublist(0, optionsToTake));
      }
      options.shuffle(random);
      return options;
    }

    for (int i = 0; i < 2; i++) {
      var item = familyData[random.nextInt(familyData.length)];
      newQuestions.add(Question(
        questionText: '"${item["japName"]}" wa Eigo de nanto iimasu ka?',
        type: QuestionType.multipleChoice,
        options: getShuffledOptions(
          item["EnName"]!,
          familyData
              .where((e) => e["EnName"] != item["EnName"])
              .map((e) => e["EnName"]!)
              .toList(),
        ),
        correctAnswer: item["EnName"]!,
      ));
    }
    for (int i = 0; i < 2; i++) {
      var item = familyData[random.nextInt(familyData.length)];
      newQuestions.add(Question(
        questionText:
        'Kuuhaku wo umete kudasai: "${item["EnName"]}" wa Nihongo de _ desu.',
        type: QuestionType.fillInTheBlank,
        correctAnswer: item["japName"]!,
      ));
    }

    for (int i = 0; i < 2; i++) {
      var item = colorsData[random.nextInt(colorsData.length)];
      newQuestions.add(Question(
        questionText: '"${item["japName"]}" no iro wa nani desu ka?',
        type: QuestionType.multipleChoice,
        options: getShuffledOptions(
          item["EnName"]!,
          colorsData
              .where((e) => e["EnName"] != item["EnName"])
              .map((e) => e["EnName"]!)
              .toList(),
        ),
        correctAnswer: item["EnName"]!,
      ));
    }
    var colorItem = colorsData[random.nextInt(colorsData.length)];
    newQuestions.add(Question(
      questionText:
      'Kuuhaku wo umete kudasai: "${colorItem["EnName"]}" no iro wa _ desu.',
      type: QuestionType.fillInTheBlank,
      correctAnswer: colorItem["japName"]!,
    ));

    var phraseItem = phrasesData[random.nextInt(phrasesData.length)];
    newQuestions.add(Question(
      questionText: '"${phraseItem["EnName"]}" wa Nihongo de nanto iimasu ka?',
      type: QuestionType.multipleChoice,
      options: getShuffledOptions(
        phraseItem["japName"]!,
        phrasesData
            .where((e) => e["japName"] != phraseItem["japName"])
            .map((e) => e["japName"]!)
            .toList(),
      ),
      correctAnswer: phraseItem["japName"]!,
    ));
    var phraseItem2 = phrasesData[random.nextInt(phrasesData.length)];
    newQuestions.add(Question(
      questionText:
      'Kuuhaku wo umete kudasai: "${phraseItem2["EnName"]}" wa Nihongo de _ desu.',
      type: QuestionType.fillInTheBlank,
      correctAnswer: phraseItem2["japName"]!,
    ));

    var numIndex = random.nextInt(numbersData.length - 1);
    newQuestions.add(Question(
      questionText: '"${numbersData[numIndex]}" no tsugi no kazu wa nani desu ka?',
      type: QuestionType.multipleChoice,
      options: getShuffledOptions(
        numbersData[numIndex + 1],
        numbersData
            .where((e) => e != numbersData[numIndex + 1])
            .toList(),
      ),
      correctAnswer: numbersData[numIndex + 1],
    ));
    newQuestions.add(Question(
      questionText:
      'Kuuhaku wo umete kudasai: ${numIndex + 1} wa Nihongo de _ desu.',
      type: QuestionType.fillInTheBlank,
      correctAnswer: numbersData[numIndex],
    ));

    var foodItem = foodData[random.nextInt(foodData.length)];
    newQuestions.add(Question(
      questionText: '"${foodItem["japName"]}" wa Eigo de nanto iimasu ka?',
      type: QuestionType.multipleChoice,
      options: getShuffledOptions(
        foodItem["EnName"]!,
        foodData
            .where((e) => e["EnName"] != foodItem["EnName"])
            .map((e) => e["EnName"]!)
            .toList(),
      ),
      correctAnswer: foodItem["EnName"]!,
    ));

    newQuestions.shuffle(random);
    return newQuestions;
  }

  void _submitQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          questions: questions,
          userAnswers: userAnswers,
        ),
      ),
    );
  }

  void _changeQuestions() {
    setState(() {
      questions = generateQuestions();
      userAnswers = List.filled(12, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _changeQuestions,
            child: Icon(
              Icons.refresh,
              color: Colors.black, // لون الأيقونة من الثيم
            ),
            backgroundColor: Colors.amber, // لون الخلفية من الثيم
            tooltip: 'Atarashii shitsumon',
            heroTag: 'changeQuestions',
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _submitQuiz,
            child: Icon(
              Icons.done,
              color: Colors.black, // لون الأيقونة من الثيم
            ),
            backgroundColor: Colors.amber, // لون الخلفية من الثيم
            tooltip: 'Kuizu wo teishutsu',
            heroTag: 'submitQuiz',
          ),
        ],
      ),
    );
  }
}

enum QuestionType { multipleChoice, fillInTheBlank }