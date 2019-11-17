import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.destructiveRed,
          middle: Text("Home Page", style: TextStyle(color: Colors.white)),
        ),
        child: Container(
          child: Center(
            child: Text("Home Page"),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
