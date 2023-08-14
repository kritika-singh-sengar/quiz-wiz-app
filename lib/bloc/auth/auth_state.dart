import 'package:equatable/equatable.dart';
import 'package:quiz_wiz/enums/auth_status_enum.dart';

import '../../models/user_model.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User user;

  const AuthState._({
    required this.authStatus,
    this.user = User.empty,
  });

  const AuthState.authenticated(User user)
    : this._(authStatus: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
    : this._(authStatus: AuthStatus.unauthenticated);
  
  @override
  List<Object?> get props => [authStatus, user];

}