import 'package:equatable/equatable.dart';
import 'package:quiz_wiz/models/result_model.dart';

abstract class ResultState extends Equatable {
  const ResultState();

  @override
  List<Object> get props => [];
}

class ResultLoading extends ResultState {}

class ResultLoaded extends ResultState {
  final List<Result> result;

  const ResultLoaded({this.result = const <Result>[]});

  @override
  List<Object> get props => [result];
}