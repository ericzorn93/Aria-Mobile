import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
