import 'package:quiz_wiz/models/user_model.dart';
import 'package:quiz_wiz/repository/user/user_repository.dart';

class StartUPService {

  final UserRepository _userRepository;

  const StartUPService({required UserRepository userRepository}) : _userRepository = userRepository;

  void login(LoginCredential credential) {
    print('user');
    Stream<User> user = _userRepository.getUserByEmail(credential.email);
    print(user);
  }

  void signup(Map<String, dynamic> user) {
    _userRepository.createUser(user['email'], user);
  }
  
}