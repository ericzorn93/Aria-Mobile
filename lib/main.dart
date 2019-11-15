import 'dart:io';
import 'package:aria/blocs/auth_bloc/login/LoginBloc.dart';
import 'package:aria/pages/auth/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AriaApp());

class AriaApp extends StatelessWidget {
  String _appTitle = "Aria Music";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
          title: _appTitle,
          home: MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                builder: (BuildContext context) => LoginBloc(),
              ),
            ],
            child: LoginPage(),
          ));
    }

    return MaterialApp(
        title: 'Aria Music',
        theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.red,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              builder: (BuildContext context) => LoginBloc(),
            ),
          ],
          child: LoginPage(),
        ));
  }
}
