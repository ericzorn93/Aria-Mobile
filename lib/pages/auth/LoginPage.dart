import 'dart:io';
import 'package:aria/blocs/auth_bloc/login/LoginBloc.dart';
import 'package:aria/blocs/auth_bloc/login/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Login"),
          ),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Container(
                child: Center(
                  child: Text(state.emailAddress),
                ),
              );
            },
          ));
    }
    ;

    return (Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    ));
  }
}
