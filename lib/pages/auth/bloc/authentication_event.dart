import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String emailAddress;
  final String password;

  LoginEvent({@required this.emailAddress, @required this.password});

  @override
  List<Object> get props => [emailAddress, password];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
