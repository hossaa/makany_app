import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makany/Thems/colors.dart';

import 'image_paker.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _city = '';
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
    "Yanbu",
    "Buraidah",
    "Patience",
    "Al-Jubail",
    "Al Khobar",
    "Najran",
    "Hail",
    "Jizan",
    "Dhahran",
    "Abha",
    "Taif",
  ];

  static final List<String> _tybes = ['', 'building', 'Real estate'];
  String _tybe = _tybes[0];
  int selectedV = 0;
  List<String> _buildings = <String>[
    '',
    'Pants',
    'Carpentary',
    'Carpentry works',
    'Design'
  ];
  String _building = '';
  List<String> _realEstates = <String>[
    '',
    'Apartment',
    'Villas',
    'Restorts',
    'Station For Sale',
    'Land For Sale',
    'Vacation For Rent',
    'Vacation For Sale'
  ];
  String _realEstate = '';

  final Map<String, dynamic> _formdata = {
    'Adress ads': '',
    'Ads Deteils': '',
    'vedio link': '',
    'Price': '',
    'SelectCitys': '',
    'Ad Type': '',
    'Ad Location': '',
    '_citys': ''
  };
  Widget _adressadsTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'address ads',
        hintText: 'your address ads',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          Icons.map,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
          return 'please Enter Adress ads';
        }
      },
      onSaved: (String value) {
        _formdata['Adress ads'] = value;
      },
    );
  }

  Widget _detielsAdsTextfield() {
    return TextFormField(
      // autocorrect: true,
      // autofocus: true,
      // autovalidate: true,
      // enabled: true,
      // maxLengthEnforced: true,
      // obscureText: true,

      decoration: InputDecoration(
        labelText: 'Ads Deteils',
        hintText: 'your Ads Deteils',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          Icons.add_to_home_screen,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
          return 'please Enter Ads Deteils';
        }
      },
      onSaved: (String value) {
        _formdata['Ads Deteils'] = value;
      },
    );
  }

  Widget _videoTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'vedio link',
        hintText: 'your vedio link',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          FontAwesomeIcons.youtube,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'please Enter vedio link';
        }
      },
      onSaved: (String value) {
        _formdata['Ad Typevedio link'] = value;
      },
    );
  }

  Widget _priceTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Price',
        hintText: 'your Price',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          FontAwesomeIcons.moneyBill,
          color: accentColor,
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty || !RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
          return 'please Enter Ads Deteils';
        }
      },
      onSaved: (String value) {
        _formdata['Price'] = value;
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
                  // newUserLogin.citys = newValue;
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
        // newUserLogin.citys = value;
      },
    );
  }

  Widget _adsTypeTextfield() {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Ad Type',
            hintText: 'add your Ad Type',
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: accentColor),
            icon: Icon(
              FontAwesomeIcons.folderPlus,
              color: accentColor,
            ),
          ),
          isEmpty: _tybe == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _tybe,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  _tybe = newValue;
                  selectedV = _tybes.indexOf(newValue);
                  // newUserLogin.citys = newValue;
                  // if(selectedV==newValue.indexOf('building')){
                  //   return _buildingTextfield();
                  // }

                  // state.didChange(newValue);
                });
              },
              items: _tybes.map((String value) {
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
          return 'please ';
        }
      },
      onSaved: (String value) {
        _formdata['Ad Type'] = value;
      },
    );
  }

  Widget _buildingTextfield() {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Ad building',
            hintText: 'ad your building',
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: accentColor),
            icon: Icon(
              FontAwesomeIcons.home,
              color: accentColor,
            ),
          ),
          isEmpty: _building == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _building,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  // newUserLogin.citys = newValue;
                  _building = newValue;
                  state.didChange(newValue);
                });
              },
              items: _buildings.map((String value) {
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
          return 'please ';
        }
      },
      onSaved: (String value) {
        _formdata['build'] = value;
      },
    );
  }

  Widget __realEstateTextfield() {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Ad Estate',
            hintText: 'add your Estate',
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: accentColor),
            icon: Icon(
              FontAwesomeIcons.houseDamage,
              color: accentColor,
            ),
          ),
          isEmpty: _realEstate == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _realEstate,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  // newUserLogin.citys = newValue;
                  _realEstate = newValue;
                  state.didChange(newValue);
                });
              },
              items: _realEstates.map((String value) {
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
          return 'please ';
        }
      },
      onSaved: (String value) {
        _formdata['Ad Type'] = value;
      },
    );
  }

  Widget _adsLocationTextfield() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Ad Location',
        hintText: 'add your Ad Location',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: accentColor),
        icon: Icon(
          FontAwesomeIcons.mapMarker,
          color: accentColor,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'please ';
        }
      },
      onSaved: (String value) {
        _formdata['Ad Location'] = value;
      },
    );
  }

  Future _submitsginUp() async {
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
        centerTitle: true,
        title: Text('Makany'),
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
                            color: accentColor, size: 40),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text('MakanY',
                            style: TextStyle(color: accentColor, fontSize: 15)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _adressadsTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      _detielsAdsTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      _priceTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      _videoTextfield(),
                      SizedBox(
                        height: 15,
                      ),
                      _selectcityTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      _adsTypeTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      // if(_adsTypeTextfield(context) ){},
                      // SizedBox(
                      //   height: 10,
                      // ),
                      _adsLocationTextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: ImageInput(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        onPressed: () {
                          _submitsginUp();
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
                              'Add Poster',
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
