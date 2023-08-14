import 'package:quiz_wiz/models/user_model.dart';

abstract class BaseUserRepository {
  Stream<List<User>> getAllUser();
  Stream<User> getUserByEmail(String email);
  void createUser(String docId, Map<String, dynamic> user);
  void logoutUser();
}