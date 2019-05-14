import 'package:flutter/material.dart';
import 'package:makany/menu_item/drawer.dart';
import '../Thems/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrwoItem(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Makany'),
        elevation: 0,
      ),
      body: GridCards(),
    );
  }
}

class GridCards extends StatelessWidget {
  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        // color: Colors.deepPurple[100],
        elevation: 15.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            onTap: onTap != null ? () => onTap() : () {}, child: child));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: StaggeredGridView.count(
        staggeredTiles: [
          // StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
          StaggeredTile.extent(1, 90),
         
        ],
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 40,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.plus,
                          color: Colors.blue[300], size: 35),
                    )),
                    Text('Add Poster',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/addpage');
            },
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.home,
                          color: Colors.cyan[700], size: 35),
                    )),
                    Text('Home',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.star,
                          color: Colors.yellow[600], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('Popular',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/Poupular');
            },
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.userPlus,
                          color: Colors.green[300], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('My Ads Poster',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/Myposters');
            },
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.solidHeart,
                          color: Colors.red[300], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('Favorite',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {},
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.calendarPlus,
                          color: Colors.pink[200], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('Ads Today',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {},
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.hotel,
                          color: Colors.indigo[400], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('Real Estate',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {},
          ),
          _buildTile(
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                        child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(FontAwesomeIcons.solidBuilding,
                          color: Colors.grey[600], size: 35),
                    )),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Text('Building',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ]),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
