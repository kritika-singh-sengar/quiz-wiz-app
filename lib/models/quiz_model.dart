import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quiz_wiz/models/qna_model.dart';

@immutable
class Quiz extends Equatable {
  final String quizId;
  final String quizTopic;
  final int totalNumberOfQuestions;
  final List<dynamic> questions;
  final List<dynamic> answers;

  const Quiz({
    required this.quizId,
    required this.quizTopic,
    required this.totalNumberOfQuestions,
    required this.questions,
    required this.answers,
  });

  @override
  List<Object?> get props => [
        quizId,
        quizTopic,
        totalNumberOfQuestions,
        questions,
        answers
      ];

  static Quiz quizSnapshot(DocumentSnapshot snapshot) {
    Quiz quiz = Quiz(
      quizId: snapshot['quizId'],
      quizTopic: snapshot['quizTopic'],
      totalNumberOfQuestions: snapshot['totalNumberOfQuestions'],
      questions: snapshot['questions'],
      answers: snapshot['answers']
    );
    return quiz;
  }
}
