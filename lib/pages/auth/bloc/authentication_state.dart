import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  final String emailAddress;
  final String password;
  final bool emailAddressValid;
  final bool passwordValid;
  final bool loggedIn;
  final String token;

  const AuthenticationState(
      {this.emailAddress,
      this.password,
      this.emailAddressValid,
      this.passwordValid,
      this.loggedIn,
      this.token});

  factory AuthenticationState.initial() {
    return AuthenticationState(
        emailAddress: '',
        password: '',
        emailAddressValid: false,
        passwordValid: false,
        loggedIn: false,
        token: '');
  }

  AuthenticationState copyWith({
    String emailAddress,
    String password,
    bool emailAddressValid,
    bool passwordValid,
    bool loggedIn,
    String token,
  }) {
    return AuthenticationState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        emailAddressValid: emailAddressValid ?? this.emailAddressValid,
        passwordValid: passwordValid ?? this.passwordValid,
        loggedIn: loggedIn ?? this.loggedIn,
        token: token ?? this.token);
  }

  @override
  List<Object> get props =>
      [emailAddress, password, emailAddressValid, loggedIn, token];
}
