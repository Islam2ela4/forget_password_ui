import 'package:flutter/material.dart';

class Reset_pass extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Verification Code",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        leadingWidth: 45,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 60),
                  child: Text(
                    'New Password',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Please write your new password.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                ////////////////////
                Column(
                  children: <Widget>[
                    SizedBox(height: 35),
                    TextFieldPass(hint: 'Password'),
                    SizedBox(height: 15),
                    TextFieldPass(hint: 'Confirm Password'),
                    SizedBox(height: 35),
                  ],
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurpleAccent
                  ),
                  child: RaisedButton(
                    child: Text("Confirm Password", style: TextStyle(fontSize: 17),),
                    color: Colors.deepPurpleAccent,
                    elevation: 0,
                    textColor: Colors.white,
                    hoverColor: Colors.deepPurpleAccent,
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('Your password changed successfully'))
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldPass extends StatelessWidget {
  String hint;

  TextFieldPass({this.hint});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.black38,
              width: 1.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter new password';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hint,
              labelText: hint,
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              border: InputBorder.none,
            ),
            cursorColor: Colors.deepPurple,
            autofocus: false,
            obscureText: true,
          ),
        ),
      ],
    );
  }
}