import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:aria/pages/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aria/blocs/CounterBloc.dart';

void main() => runApp(AriaApp());

class AriaApp extends StatelessWidget {
  String _appTitle = "Aria Music (Currently Counter)";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: _appTitle,
        home: BlocProvider<CounterBloc>(
            builder: (context) => CounterBloc(),
            child: MyHomePage(title: 'Flutter Demo Home Page')),
      );
    }

    return MaterialApp(
      title: 'Aria Music (Currently Counter)',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.red,
      ),
      home: BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}
