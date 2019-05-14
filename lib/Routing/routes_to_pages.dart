import 'package:flutter/material.dart';
import 'package:makany/Signing/login.dart';
import 'package:makany/Signing/signup.dart';
import 'package:makany/pages/Location_page.dart';
import 'package:makany/pages/Main_page_Det/add_Ads.dart';
import 'package:makany/pages/Main_page_Det/myAdds.dart';
import 'package:makany/pages/Main_page_Det/poupular_page.dart';
import 'package:makany/pages/home.dart';
import 'package:makany/pages/main_page.dart';
import '../main.dart';

// Navigator.pushNamed('/mainpage');
//hna lw 3ayez abasy data // Navigator.pushNamed('/mainpage',arguments: ksndksbsk);
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // hna 3lshan lw 3ayez abasy data
    final asd = settings.arguments;

    switch (settings.name) {
      case '/':
        /*
        3lshan lma a7b abasy data  
        if(asd is String){
        return MaterialPageRoute(
          builder: (_) => HomePage(data:asd,),
      }
      */
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/mainpage':
        return MaterialPageRoute(
          builder: (_) => MyMainPage(),
        );
      case '/loctionpage':
        return MaterialPageRoute(
          builder: (_) => MyLocationPage(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case '/addpage':
        return MaterialPageRoute(
          builder: (_) => AddPage(),
        );
      case '/Myposters':
        return MaterialPageRoute(
          builder: (_) => MyAddsPoster(),
        );
      case '/Poupular':
        return MaterialPageRoute(
          builder: (_) => PopularAds(),
        );
    }
  }
}
