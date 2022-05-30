import 'package:aplikacja__mobilna/connect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposePage extends StatefulWidget {
  ComposePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComposePageState();
}

class _ComposePageState extends State<ComposePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final emailController = TextEditingController();
  final topicController = TextEditingController();
  final messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final topicField = TextField(
      controller: topicController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Topic",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final messageField = TextField(
      controller: messageController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 80.0),
          hintText: "Message",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final submitButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () {
          },
            child: Text("Submit",
               textAlign: TextAlign.center,
               style: style.copyWith(
               color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 55.0),
                emailField,
                SizedBox(height: 35.0),
                topicField,
                SizedBox(height: 45.0),
                messageField,
                SizedBox(height: 25.0,),
                submitButon,
                SizedBox(height: 25.0,),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
