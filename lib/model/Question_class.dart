enum QuestionType { multipleChoice, fillInTheBlank }

class Question {
  final String questionText;
  final QuestionType type;
  final List<String>? options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.type,
    this.options,
    required this.correctAnswer,
  });
}
