import 'package:flutter/material.dart';
import 'package:forget_pass_ui/reset_pass.dart';

class Verfication_code extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: <Widget>[
                  Image.asset(
                    'assets/images/forget_pass2.png',
                    width: 210.23,
                    height: 191.75,
                  ),
                  Text(
                    'Verify email address',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 27, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Verification code sent to: ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          ' lily12@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurpleAccent
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFieldCode(),
                      TextFieldCode(),
                      TextFieldCode(),
                      TextFieldCode()
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
                      child: Text("Confirm Code", style: TextStyle(fontSize: 17),),
                      color: Colors.deepPurpleAccent,
                      elevation: 0,
                      textColor: Colors.white,
                      hoverColor: Colors.deepPurpleAccent,
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return Reset_pass();
                          },));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '00:29   ',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'Resend Confirmation Code'
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class TextFieldCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 55,
          height: 55,
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
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
          margin: EdgeInsets.symmetric(vertical: 35, horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 55,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if(value == null || value.isEmpty){
                return '';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '---',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              border: InputBorder.none,
            ),
            cursorColor: Colors.deepPurpleAccent,
          ),
        ),
      ],
    );
  }
}

