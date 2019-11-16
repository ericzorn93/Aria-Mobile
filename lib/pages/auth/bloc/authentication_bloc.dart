import 'dart:async';
import 'package:aria/pages/auth/repositories/UserRepository.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository = UserRepository();

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})',
  );

  @override
  AuthenticationState get initialState => AuthenticationState.initial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is UpdateEmailEvent) {
      yield state.copyWith(
          emailAddress: event.emailAddress,
          emailAddressValid: _validateEmailAddress(event.emailAddress));
    } else if (event is UpdatePasswordEvent) {
      yield state.copyWith(
          password: event.password,
          passwordValid: _validatePassword(event.password));
    } else if (event is LoginEvent) {
      final bool loggedIn = await _login();
      yield state.copyWith(
        loggedIn: loggedIn,
      );
    } else if (event is LogoutEvent) {
      yield state.copyWith(
          emailAddress: "",
          password: "",
          emailAddressValid: false,
          passwordValid: false);
    }
  }

  bool _validateEmailAddress(String emailAddress) {
    return _emailRegExp.hasMatch(emailAddress);
  }

  bool _validatePassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  Future<bool> _login() async {
    final String token = await _userRepository.login();

    if (token != null) {
      return true;
    }

    return false;
  }
}
