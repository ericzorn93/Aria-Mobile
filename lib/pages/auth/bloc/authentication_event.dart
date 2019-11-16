import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class UpdateEmailEvent extends AuthenticationEvent {
  final String emailAddress;

  UpdateEmailEvent({@required this.emailAddress});

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
