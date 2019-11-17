import 'dart:io';
import 'package:aria/pages/auth/bloc/authentication_bloc.dart';
import 'package:aria/pages/auth/bloc/authentication_event.dart';
import 'package:aria/pages/auth/bloc/authentication_state.dart';
import 'package:aria/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loginPressed = false;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, AuthenticationState state) {
          if (state.loggedIn) {
            _successfulLoginNavigate(context, HomePage());
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: CupertinoColors.destructiveRed,
            ),
            child: Form(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Aria",
                      style: TextStyle(fontSize: 50),
                    ),
                    CupertinoTextField(
                      controller: _emailController,
                      placeholder: "Please enter your email address",
                      autocorrect: true,
                    ),
                    CupertinoTextField(
                      placeholder: "Please enter your password",
                      controller: _passwordController,
                      autocorrect: false,
                    ),
                    IgnorePointer(
                      ignoring: _loginPressed,
                      child: CupertinoButton(
                        child: Text("Submit"),
                        color: _loginPressed
                            ? Colors.deepOrange
                            : CupertinoColors.destructiveRed,
                        onPressed: () {
                          if (!_loginPressed) {
                            _handleFormSubmit(context, state);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      );
    }

    return (Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.red,
      ),
    ));
  }

  void _onEmailChanged() {
    _authBloc.add(UpdateEmailEvent(emailAddress: _emailController.text));
  }

  void _onPasswordChanged() {
    _authBloc.add(UpdatePasswordEvent(password: _passwordController.text));
  }

  void _handleFormSubmit(
      BuildContext context, AuthenticationState currentFormState) {
    _authBloc.add(LoginEvent());

    setState(() {
      _loginPressed = true;
    });
  }

  void _successfulLoginNavigate(BuildContext context, Widget route) {
    if (Platform.isIOS) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => HomePage()));
    } else if (Platform.isAndroid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
