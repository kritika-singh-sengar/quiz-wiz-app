import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Question extends Equatable {
  final String questionId;
  final String question;
  final List<String> options;
  final String? selectedOption;

  const Question(
      {required this.questionId,
      required this.question,
      required this.options,
      this.selectedOption
    });

  @override
  List<Object?> get props => [
        questionId,
        question,
        options,
        selectedOption,
      ];
}

@immutable
class Answer {
  final String questionId;
  final String answer;

  const Answer({
    required this.questionId,
    required this.answer,
  });

}
