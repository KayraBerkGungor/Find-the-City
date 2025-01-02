import 'dart:convert';
import 'package:flutter/services.dart';

class Question {
  final String question;
  final String answer;

  Question({required this.question, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answer: json['answer'],
    );
  }

  static List<Question> fromJsonList(String jsonString) {
    final data = json.decode(jsonString) as List<dynamic>;
    return data.map((item) => Question.fromJson(item)).toList();
  }
}

Future<List<Question>> loadQuestions() async {
  final String response = await rootBundle.loadString('assets/questions.json');
  return Question.fromJsonList(response);
}