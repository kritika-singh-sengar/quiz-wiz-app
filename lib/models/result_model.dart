import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Result extends Equatable {
  final String resultId;
  final String quizId;
  final int totalNumberOfQuestion;
  final int totalQuestionAttempted;
  final int questionNotAttempted;
  final String quizTopic;
  final int correctAnswers;
  final String status;

  const Result({
    required this.resultId,
    required this.quizId,
    required this.totalNumberOfQuestion,
    required this.totalQuestionAttempted,
    required this.questionNotAttempted,
    required this.correctAnswers,
    required this.status,
    required this.quizTopic,
  });

  @override
  List<Object?> get props => [
        resultId,
        quizId,
        totalNumberOfQuestion,
        totalQuestionAttempted,
        questionNotAttempted,
        quizTopic,
        correctAnswers,
        status
      ];

  static Result resultSnapshot(DocumentSnapshot snapshot) {
    Result result = Result(
        resultId: snapshot['resultId'],
        quizId: snapshot['quizId'],
        totalNumberOfQuestion: snapshot['totalNumberOfQuestion'],
        totalQuestionAttempted: snapshot['totalQuestionAttempted'],
        questionNotAttempted: snapshot['questionNotAttempted'],
        quizTopic: snapshot['quizTopic'],
        correctAnswers : snapshot['correctAnswers'],
        status : snapshot['status']
      );
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['resultId'] = resultId;
    data['quizId'] = quizId;
    data['totalNumberOfQuestion'] = totalNumberOfQuestion;
    data['totalQuestionAttempted'] = totalQuestionAttempted;
    data['questionNotAttempted'] = questionNotAttempted;
    data['quizTopic'] = quizTopic;
    data['correctAnswers'] = correctAnswers;
    data['status'] = status;
    return data;
  }
}
