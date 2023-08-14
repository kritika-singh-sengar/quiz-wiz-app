import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_wiz/constants/collection_constant.dart';
import 'package:quiz_wiz/models/quiz_model.dart';
import 'package:quiz_wiz/repository/quiz/base_quiz_repository.dart';

class QuizRepository extends BaseQuizRepository {
  
  final FirebaseFirestore _firebaseFirestore;

  QuizRepository({FirebaseFirestore? firebaseFirestore}) :
    _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance; 

  @override
  Stream<List<Quiz>> getAllQuiz() {
    return _firebaseFirestore
      .collection(Collection.quiz)
      .snapshots()
      .map((snapshot) => 
        snapshot.docs.map((quiz) => Quiz.quizSnapshot(quiz)).toList()
      );
  }

  @override
  Stream<Quiz> getQuizById(String docId) {
    return _firebaseFirestore
      .collection(Collection.quiz)
      .doc(docId)
      .snapshots()
      .map((snapshot) => Quiz.quizSnapshot(snapshot)
    );
  }
  
}