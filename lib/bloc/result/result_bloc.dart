import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/result/result_event.dart';
import 'package:quiz_wiz/bloc/result/result_state.dart';
import 'package:quiz_wiz/repository/result/result_repository.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final ResultRepository _resultRepository;
  // final QuizRepository _quizRepository;//may be need in case of perticular result show
  StreamSubscription? _resultSubscription;

  ResultBloc(
      {required ResultRepository resultRepository})
      : _resultRepository = resultRepository,
        super(ResultLoading());
 
  @override
  Stream<ResultState> mapEventToState(ResultEvent event) async* {
    if(event is LoadResult) {
      yield* _mapLoadResultToState();
    }
    if(event is UpdateResult) {
      yield* _mapUpdatedResultToState(event);
    }
  }
  
  Stream<ResultState> _mapLoadResultToState() async*{
    _resultSubscription?.cancel();
    _resultSubscription = _resultRepository.getAllResult().listen(
      (result) => add(
        UpdateResult(result: result),
      ),
    );
  }
  
  Stream<ResultState> _mapUpdatedResultToState(UpdateResult event) async*{
    yield ResultLoaded(result: event.result);
  }
  
}
