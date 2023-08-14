import 'package:quiz_wiz/models/result_model.dart';

abstract class BaseResultRepository {
  Stream<List<Result>> getAllResult();
  Stream<Result> getResultById(String docId);
}