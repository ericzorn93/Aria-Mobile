import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  final String emailAddress;

  InitialAuthenticationState({this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class UnauthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
