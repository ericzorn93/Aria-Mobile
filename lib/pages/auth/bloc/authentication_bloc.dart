import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
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
    } else {
      yield AuthenticationState.initial();
    }
  }

  bool _validateEmailAddress(String emailAddress) {
    return _emailRegExp.hasMatch(emailAddress);
  }
}
