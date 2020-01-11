import 'package:albums/screens/artist_page.dart';
import 'package:albums/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The World of Michael Jackson',
      //To hide debug bannner uncommect the following line
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/ArtistPage': (BuildContext context) => new ArtistPage(),
      },
    );
  }
}
