import 'package:flutter/material.dart';

import 'package:aria/pages/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aria/blocs/CounterBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
