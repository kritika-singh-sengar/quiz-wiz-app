import 'package:quiz_wiz/models/quiz_model.dart';

abstract class BaseQuizRepository {
  Stream<List<Quiz>> getAllQuiz();
  Stream<Quiz> getQuizById(String docId);
}