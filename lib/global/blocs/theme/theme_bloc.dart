import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => InitialThemeState();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
