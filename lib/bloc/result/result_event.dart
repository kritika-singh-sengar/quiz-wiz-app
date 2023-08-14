import 'package:equatable/equatable.dart';
import 'package:quiz_wiz/models/result_model.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class LoadResult extends ResultEvent{}

class UpdateResult extends ResultEvent{
  final List<Result> result;

  const UpdateResult({required this.result});

  @override
  List<Object> get props => [result];
}