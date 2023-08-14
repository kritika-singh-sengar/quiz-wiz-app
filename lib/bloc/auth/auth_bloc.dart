import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_wiz/bloc/auth/auth_event.dart';
import 'package:quiz_wiz/bloc/auth/auth_state.dart';
import 'package:quiz_wiz/repository/user/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserRepository _userRepository;
  StreamSubscription? _userSubscription;

  AuthBloc({required UserRepository userRepository}) 
    : _userRepository = userRepository,
    super(
      UserRepository.currentUser.isNotEmpty
      ? AuthState.authenticated(UserRepository.currentUser)
      : const AuthState.unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is LogoutRequested) {
      yield* _mapLogoutRequestToState(event);
    }
    if(event is UpdateUser) {
      yield* _mapUpdatedUserToState(event);
    }
  }
  
  Stream<AuthState> _mapUpdatedUserToState(UpdateUser event) async*{
    _userSubscription?.cancel();
    event.user.isNotEmpty 
      ? AuthState.authenticated(event.user)
      : const AuthState.unauthenticated();
  }

  Stream<AuthState> _mapLogoutRequestToState(LogoutRequested event) async*{
    _userRepository.logoutUser();
  }
  
}