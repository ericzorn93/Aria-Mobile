import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  final String emailAddress;
  final String password;
  final bool emailAddressValid;

  const AuthenticationState(
      {this.emailAddress, this.password, this.emailAddressValid});

  factory AuthenticationState.initial() {
    return AuthenticationState(
      emailAddress: '',
      password: '',
      emailAddressValid: false,
    );
  }

  AuthenticationState copyWith({
    String emailAddress,
    String password,
    bool emailAddressValid,
  }) {
    return AuthenticationState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        emailAddressValid: emailAddressValid ?? this.emailAddressValid);
  }

  @override
  List<Object> get props => [emailAddress, password, emailAddressValid];
}
