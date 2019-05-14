import 'package:flutter/material.dart';
import 'Routing/routes_to_pages.dart';

void main() {
// MapView.setApiKey("AIzaSyD8lmhNlfbo8Hh_hpsmMaoBnV_R89PRBok");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.cyan[900],
        accentColor: Colors.cyan[900],
        primaryColorBrightness: Brightness.dark,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
