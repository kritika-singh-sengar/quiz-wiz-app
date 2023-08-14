import 'package:equatable/equatable.dart';
import 'package:quiz_wiz/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LogoutRequested extends AuthEvent {}

class UpdateUser extends AuthEvent {
  final User user;
  
  const UpdateUser({
    required this.user
  });

  @override
  List<Object?> get props => [user];

}