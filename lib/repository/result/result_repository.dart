import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_wiz/constants/collection_constant.dart';
import 'package:quiz_wiz/models/result_model.dart';

import 'base_result_repository.dart';

class ResultRepository extends BaseResultRepository {
  
  final FirebaseFirestore _firebaseFirestore;

  ResultRepository({FirebaseFirestore? firebaseFirestore}) :
    _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance; 

  @override
  Stream<List<Result>> getAllResult() {
    return _firebaseFirestore
      .collection(Collection.result)
      .snapshots()
      .map((snapshot) => 
        snapshot.docs.map((result) => Result.resultSnapshot(result)).toList()
      );
  }

  @override
  Stream<Result> getResultById(String docId) {
    return _firebaseFirestore
      .collection(Collection.result)
      .doc(docId)
      .snapshots()
      .map((snapshot) => Result.resultSnapshot(snapshot)
    );
  }
  
}