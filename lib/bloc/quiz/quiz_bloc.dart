import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_event.dart';
import 'package:quiz_wiz/bloc/quiz/quiz_state.dart';
import 'package:quiz_wiz/repository/quiz/quiz_repository.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {

  final QuizRepository _quizRepository;
  StreamSubscription? _quizSubscription;

  QuizBloc({required QuizRepository quizRepository}) 
    : _quizRepository = quizRepository, super(QuizLoading());

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if(event is LoadQuiz) {
      yield* _mapLoadQuizToState();
    }
    if(event is UpdateQuiz) {
      yield* _mapUpdatedQuizToState(event);
    }
  }
  
  Stream<QuizState> _mapLoadQuizToState() async*{
    _quizSubscription?.cancel();
    _quizSubscription = _quizRepository.getAllQuiz().listen(
      (quiz) => add(
        UpdateQuiz(quiz: quiz),
      ),
    );
  }

  Stream<QuizState> _mapUpdatedQuizToState(UpdateQuiz event) async*{
    yield QuizLoaded(quiz: event.quiz);
  }
  
}