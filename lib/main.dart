import 'dart:io';
import 'package:aria/global/blocs/theme/bloc.dart';
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

// @param {Widget} mainApp Uses a muti bloc provider to pass initial state to each child component
  Widget _loadInitialApp(Widget mainApp) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          builder: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: mainApp,
    );
  }

  @override
  Widget build(BuildContext context) {
    // IOS App
    if (Platform.isIOS) {
      return _loadInitialApp(CupertinoApp(
        home: LoginPage(),
      ));
    }

    // AndroidApp
    return _loadInitialApp(MaterialApp(
      home: LoginPage(),
    ));
  }
}
