import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'package:makany/Thems/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final Map<String, dynamic> _formdata = {'email': '', 'password': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _emailTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'EMAIL',
        hintText: 'EMAIL',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          Icons.email,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'please Enter a valid Email';
        }
      },
      onSaved: (String value) {
        _formdata['email'] = value;
      },
    );
  }

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _passwordTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'PASSWORD',
        hintText: '..............',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        border: UnderlineInputBorder(),
        icon: Icon(
          Icons.lock,
          color: accentColor,
        ),
        suffixIcon: GestureDetector(
          onTap: _showPassword,
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
      obscureText: _obscureText,
      validator: (String value) {
        if (value.isEmpty || value.length <= 8) {
          return 'invalid password';
        }
      },
      onSaved: (String value) {
        _formdata['password'] = value;
      },
    );
  }

  _forgetPasswordDalog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Forgotten your password?'),
            content: _emailTextfield(),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('REST'),
                onPressed: () {},
              )
            ],
          );
        });
  }

  Future<void> _submitButton() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      child: Icon(FontAwesomeIcons.userAlt,
                          color: accentColor, size: 90),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text('MakanY',
                          style: TextStyle(color: accentColor, fontSize: 20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _emailTextfield(),
                    SizedBox(
                      height: 15,
                    ),
                    _passwordTextfield(),
                    SizedBox(
                      height: 25,
                    ),
                     FlatButton(
                        onPressed: () {
                          _submitButton();
                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      child: Text('Foeget your password?'),
                      onPressed: _forgetPasswordDalog,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
