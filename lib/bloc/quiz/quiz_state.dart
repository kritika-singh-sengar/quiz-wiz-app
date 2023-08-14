import 'package:equatable/equatable.dart';

import '../../models/quiz_model.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Quiz> quiz;

  const QuizLoaded({this.quiz = const <Quiz>[]});

  @override
  List<Object> get props => [quiz];
}

class QuizSubmitted extends QuizState {}