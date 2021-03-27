import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forget_pass_ui/verfication_code.dart';

class Forget_pass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegExp _emailValidator = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    caseSensitive: false,
    multiLine: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Text(
              'Forget Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/forget_pass.png',
                width: 210.23,
                height: 191.75,
              ),
              Text(
                'Forget Password?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 27, right: 27),
                child: Text(
                  'Please write your email to receive a confirmation code to set a new password.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black38,
                          width: 1.0,
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if(!_emailValidator.hasMatch(value)){
                            return 'Email is not valid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          labelText: "Email Address",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        cursorColor: Colors.deepPurpleAccent,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.deepPurpleAccent
                      ),
                      child: RaisedButton(
                        child: Text("Confirm Mail", style: TextStyle(fontSize: 17),),
                        color: Colors.deepPurpleAccent,
                        elevation: 0,
                        textColor: Colors.white,
                        hoverColor: Colors.deepPurpleAccent,
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return Verfication_code();
                            },));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
