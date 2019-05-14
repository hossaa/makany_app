import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:makany/Thems/colors.dart';
import 'class_items.dart';
import 'http_conf.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // List<UserLogin>_login=[];
  UserLogin newUserLogin = new UserLogin();
  List<String> _citys = <String>[
    '',
    "Riyadh",
    "Grandmother",
    "Dammam",
    "Makkah",
    "Qassim",
    "Khamis Mushait ",
    "Medina",
    "Tabuk",
    "Yanbu" "Buraidah",
    "Patience",
    "Al-Jubail",
    "Al Khobar" "Najran",
    "Hail",
    "Jizan",
    "Dhahran",
    "Abha",
    "Taif",
  ];
  String _city = '';
  final Map<String, dynamic> _formdata = {
    'username': '',
    'email': '',
    'number': '',
    'password': '',
    '_citys': ''
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _obscureText = true;

  Widget _userNameTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'UserName',
        hintText: 'your username',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          Icons.person,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
          return 'please Enter user name';
        }
      },
      onSaved: (String value) {
        newUserLogin.username = value;
      },
    );
  }

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
        newUserLogin.email = value;
      },
    );
  }

  Widget _numberTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Phone Number',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          Icons.phone,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'please Enter Number';
        }
      },
      onSaved: (String value) {
        newUserLogin.phone = double.parse(value);
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
      controller: _passwordTextController,
      validator: (String value) {
        if (value.isEmpty || value.length <= 8) {
          return 'invalid password';
        }
      },
      onSaved: (String value) {
        newUserLogin.password = value;
      },
    );
  }

  Widget _passwordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
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
        if (_passwordTextController.text != value) {
          return 'password dont match';
        }
      },
      onSaved: (String value) {
        newUserLogin.password = value;
      },
    );
  }

  Widget _selectcityTextfield() {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Select Citys',
            hintText: 'Select your city',
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: accentColor),
            icon: Icon(
              Icons.location_city,
              color: accentColor,
            ),
            errorText: state.hasError ? state.errorText : null,
          ),
          isEmpty: _city == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _city,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  newUserLogin.citys = newValue;
                  _city = newValue;
                  state.didChange(newValue);
                });
              },
              items: _citys.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'please Select City';
        }
      },
      onSaved: (String value) {
        newUserLogin.citys = value;
      },
    );
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  Future _submitsginUp() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save();
      print('subbmet or not');
      print('Form save called, newContact is now up to date...');
      print('username: ${newUserLogin.username}');
      print('email: ${newUserLogin.email}');
      print('Phone: ${newUserLogin.phone}');
      print('Email: ${newUserLogin.password}');
      print('MY CITY: ${newUserLogin.citys}');
      var sendToData = new SendToData();
      sendToData.authentication(newUserLogin).then((value) {
        showMessage('New contact created for ', Colors.blue);
      });
    }
    // if (!_formKey.currentState.validate()) {
    //   return;
    // }
    // _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Registration',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  width: targetWidth,
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: Icon(FontAwesomeIcons.home,
                            color: accentColor, size: 70),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text('MakanY',
                            style: TextStyle(color: accentColor, fontSize: 20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _userNameTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      _emailTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      _numberTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      _passwordTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      _passwordConfirmTextField(),
                      SizedBox(
                        height: 15,
                      ),
                      _selectcityTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                        onPressed: () {
                          _submitsginUp();
                          // .then((_) {
                          //   Navigator.pushNamed(context, '/mainpage');
                          // });
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
                              'Registration',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

