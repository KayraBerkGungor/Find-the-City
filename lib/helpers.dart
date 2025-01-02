import 'package:flutter/services.dart' show rootBundle;
import 'package:konum_denemee/question.dart';

Future<List<Question>> loadQuestions() async {
  final String response = await rootBundle.loadString('assets/questions.json');
  return Question.fromJsonList(response);
}