import 'dart:io';
import 'package:aria/pages/auth/LoginPage.dart';
import 'package:aria/pages/auth/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AriaApp());

class AriaApp extends StatelessWidget {
  String _appTitle = "Aria Music";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return App(
      appTitle: _appTitle,
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key key,
    @required String appTitle,
  })  : _appTitle = appTitle,
        super(key: key);

  final String _appTitle;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            builder: (BuildContext context) => AuthenticationBloc(),
          ),
        ],
        child: CupertinoApp(home: LoginPage()),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(home: LoginPage()),
    );
  }
}
