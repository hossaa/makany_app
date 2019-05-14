import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Thems/colors.dart';
import 'package:makany/menu_item/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = 'http://m.delightsapp.net/api2.jsp?do=GetAllAds';
  List data;
  Future<String> getDat() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['AllAds'];
    });
    return 'Success!';
  }

  @override
  void initState() {
    super.initState();
    this.getDat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // for menu
      drawer: DrwoItem(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Makany'),
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder(
          future: getDat(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(
                  
                ),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        data[index]['img'],
                      ),
                    ),
                    title: Text(data[index]['titlear']),
                    subtitle: Text(data[index]['price'].toString()),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             DetailsPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      // GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
      //   itemCount: data == null ? 0 : data.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Card(
      //               elevation: 5,
      //               child: Material(
      //                 child: InkWell(
      //                   onTap: () {},
      //                   child: Container(
      //                     height: 170,
      //                     width: 170,
      //                     child: GridTile(
      //                       footer: Container(
      //                         color: Colors.white54,
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(10.0),
      //                           child: Row(
      //                             children: <Widget>[
      //                               Expanded(
      //                                 child: Text(
      //                                   data[index]['titlear'],
      //                                   style: TextStyle(
      //                                       color: footercolor,
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 12.0),
      //                                 ),
      //                               ),
      //                               Text(
      //                                 data[index]['price'].toString(),
      //                                 style: TextStyle(
      //                                     color: footercolor,
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 12.0),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                       child: FadeInImage(
      //                         image: NetworkImage(
      //                           data[index]['img'],
      //                         ),
      //                         height: 50,
      //                         fit: BoxFit.cover,
      //                         placeholder: AssetImage('assets/defult.jpg'),
      //                       ),
      //                       // child: CachedNetworkImage(
      //                       //   imageUrl: data[index]['img'],
      //                       //   placeholder: CircularProgressIndicator(),
      //                       //   fit: BoxFit.cover,
      //                       // ),
      //                       // child: Image.network(
      //                       //   data[index]['img'],
      //                       //   fit: BoxFit.cover,
      //                       // ),
      //                       // child: Image.network(data[index]['img']),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

// class DetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(),
//       ),
//     );
//   }
// }
