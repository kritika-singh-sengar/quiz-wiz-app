import 'package:equatable/equatable.dart';

import '../../models/quiz_model.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
  
  @override
  List<Object> get props => [];

}

class LoadQuiz extends QuizEvent {}

class UpdateQuiz extends QuizEvent {
  final List<Quiz> quiz;

  const UpdateQuiz({required this.quiz});

  @override
  List<Object> get props => [quiz];
}

class SubmitQuiz extends QuizEvent{}
