import 'dart:io';
import 'package:aria/pages/auth/bloc/authentication_bloc.dart';
import 'package:aria/pages/auth/bloc/authentication_event.dart';
import 'package:aria/pages/auth/bloc/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationBloc _authBloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: CupertinoColors.destructiveRed,
          ),
          child: Form(
            child: ListView(
              children: <Widget>[
                CupertinoTextField(
                  controller: _emailController,
                  placeholder: "Enter email",
                  autocorrect: true,
                ),
                CupertinoTextField(
                  placeholder: "Enter Password",
                  controller: _passwordController,
                  autocorrect: false,
                ),
                Text(state.emailAddress),
                Text(state.password),
                Text(state.loggedIn.toString()),
                CupertinoButton(
                  child: Text("Submit"),
                  onPressed: () {
                    _handleFormSubmit(state);
                  },
                ),
              ],
            ),
          ),
        );
      });
    }

    return (Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
    ));
  }

  void _onEmailChanged() {
    _authBloc.add(UpdateEmailEvent(emailAddress: _emailController.text));
  }

  void _onPasswordChanged() {
    _authBloc.add(UpdatePasswordEvent(password: _passwordController.text));
  }

  void _handleFormSubmit(AuthenticationState currentFormState) {
    _authBloc.add(LoginEvent());
  }
}
