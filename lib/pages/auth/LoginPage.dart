import 'dart:io';
import 'package:aria/pages/auth/bloc/authentication_bloc.dart';
import 'package:aria/pages/auth/bloc/authentication_state.dart';
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
          child: Container(child: Center(child:
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
            if (state is InitialAuthenticationState) {
              return Text("Hello Home page");
            }

            return Text("");
          }))));
    }

    return (Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    ));
  }
}
