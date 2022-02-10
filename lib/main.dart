
import 'package:flutter/material.dart';
import 'package:web_site/pages/contacts.dart';
import 'package:web_site/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/house.jpg'), context);
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=> const MainScreen(),
        '/contacts':(context)=>const Contacts()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity,fontFamily: 'Comfortaa'),
    );
  }


}
