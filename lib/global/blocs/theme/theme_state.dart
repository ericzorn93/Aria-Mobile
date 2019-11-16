import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class InitialThemeState extends ThemeState {
  @override
  List<Object> get props => [];
}
