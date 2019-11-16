import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState =>
      InitialAuthenticationState(emailAddress: "zornwebdev@gmail.com");

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield InitialAuthenticationState();
  }
}
