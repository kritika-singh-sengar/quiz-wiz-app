import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_wiz/constants/collection_constant.dart';
import 'package:quiz_wiz/models/user_model.dart';
import 'package:quiz_wiz/repository/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final FirebaseFirestore _firebaseFirestore;

  static User currentUser = User(firstName: "Kritika", lastName: "Singh", email: "kritikasingh@gmail.com", password: "12345678", education: "B.tech");
  
  UserRepository({FirebaseFirestore? firebaseFirestore}) 
    : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<User>> getAllUser() {
    return _firebaseFirestore
      .collection(Collection.user)
      .snapshots()
      .map((snapshot) => 
        snapshot.docs.map((user) => User.fromSnapshot(user)).toList());
  }

  @override
  Stream<User> getUserByEmail(String email) {
    Stream<User> response = _firebaseFirestore
      .collection(Collection.user)
      .doc(email)
      .snapshots()
      .map((snapshot) =>
        User.fromSnapshot(snapshot))
      ;
    currentUser = response.first as User;
    return response;
  }
  
  @override
  void createUser(String docId, Map<String, dynamic> user) {
    _firebaseFirestore
      .collection(Collection.user)
      .doc(docId)
      .set(user);
  }
  
  @override
  void logoutUser() {
    currentUser = User.empty;
  }
}