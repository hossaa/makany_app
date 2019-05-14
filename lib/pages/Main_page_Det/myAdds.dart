// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAddsPoster extends StatefulWidget {
  @override
  _MyAddsPosterState createState() => _MyAddsPosterState();
}

class _MyAddsPosterState extends State<MyAddsPoster> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
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
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Makany'),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  // new TextFormField(
                  //   decoration: const InputDecoration(
                  //     icon: const Icon(Icons.phone),
                  //     hintText: 'Enter a phone number',
                  //     labelText: 'Phone',
                  //   ),
                  //   keyboardType: TextInputType.phone,
                  //   inputFormatters: [
                  //     WhitelistingTextInputFormatter.digitsOnly,
                  //   ],
                  // ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  
                  FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.color_lens),
                          labelText: 'Color',
                        ),
                        isEmpty: _color == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            elevation: 15,
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                // newContact.favoriteColor = newValue;
                                _color = newValue;
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
                      return value != '' ? null : 'Please select a color';
                    },
                    onSaved: (String value) {},
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
