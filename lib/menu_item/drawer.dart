import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:makany/Thems/colors.dart';

DecorationImage _buildBackgroundImage() {
  return DecorationImage(
    fit: BoxFit.cover,
    colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
    image: AssetImage('assets/desert.jpg'),
  );
}

class DrwoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    child: Text('Regis'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.home,
              color: accentColor,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidUser,
              color: accentColor,
            ),
            title: Text(
              "My Page",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/mainpage');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.mapMarkerAlt,
              color: accentColor,
            ),
            title: Text(
              "My Location",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/loctionpage');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.city,
              color: accentColor,
            ),
            title: Text(
              "City",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.plusCircle,
              color: accentColor,
            ),
            title: Text(
              "Add Poster",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calendarPlus,
              color: accentColor,
            ),
            title: Text(
              "Ads Today",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidStar,
              color: accentColor,
            ),
            title: Text(
              "Popular ",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.userPlus,
              color: accentColor,
            ),
            title: Text(
              "My Ads Poster ",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidHeart,
              color: accentColor,
            ),
            title: Text(
              "Favorite ",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.hotel,
              color: accentColor,
            ),
            title: Text(
              "Real Estate",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidBuilding,
              color: accentColor,
            ),
            title: Text(
              "Building",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidEnvelope,
              color: accentColor,
            ),
            title: Text(
              "My Message",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.userCog,
              color: accentColor,
            ),
            title: Text(
              "Setting",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.phone,
              color: accentColor,
            ),
            title: Text(
              "Contacts Us",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}

//================ drw location=============================
class DrawerForLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Text('Login'),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    child: Text('Regis'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: _buildBackgroundImage(),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.home,
              color: accentColor,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: accentColor),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          Divider(),
          // ROOT of this list
          ExpansionTile(
            leading: Icon(
              FontAwesomeIcons.mapMarkerAlt,
              color: accentColor,
            ),
            title: Text(
              'My Location',
              style: TextStyle(color: accentColor),
            ),
            children: <Widget>[
              ExpansionTile(
                leading: Icon(
                  FontAwesomeIcons.hotel,
                  color: accentColor,
                ),
                title: Text(
                  'Real Estate',
                  style: TextStyle(color: accentColor),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Apartment',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Villas',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Restorts',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Station For Sale',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Lands For Sale',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Vacation For Rent',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Vacation For Sale',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(
                  FontAwesomeIcons.solidBuilding,
                  color: accentColor,
                ),
                title: Text(
                  'Building',
                  style: TextStyle(color: accentColor),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Pants',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Carpentery',
                      style: TextStyle(color: accentColor),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
