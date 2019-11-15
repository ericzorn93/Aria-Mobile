class LoginState {
  final String emailAddress;
  final String password;
  final bool isLoggedIn;
  final bool isEmailValid;
  final bool isPasswordValid;

  LoginState(
      {this.emailAddress,
      this.password,
      this.isLoggedIn,
      this.isEmailValid,
      this.isPasswordValid});

  factory LoginState.initialize() {
    return LoginState(
      emailAddress: '',
      password: '',
      isPasswordValid: false,
    );
  }

  LoginState copyWith({
    String emailAddress,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
  }) {
    return LoginState(
      emailAddress: emailAddress ?? this.emailAddress,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
    );
  }
}
