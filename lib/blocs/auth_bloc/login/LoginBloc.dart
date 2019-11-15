import 'package:aria/blocs/auth_bloc/login/LoginState.dart';
import 'package:aria/events/auth_events/login/LoginEvent.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginState.initialize();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(
          emailAddress: event.emailAddress, isEmailValid: true);
    }
  }
}
