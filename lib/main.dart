
import 'package:flutter/material.dart';
import 'package:web_site/pages/about/about_page.dart';
import 'package:web_site/pages/contacts/contacts.dart';
import 'package:web_site/pages/main_screen/main_screen.dart';
import 'package:web_site/pages/services/service.dart';
import 'package:web_site/pages/services/service_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=> const MainScreen(),
        '/contacts':(context)=>const Contacts(),
        '/about':(context)=>const AboutMain(),
        '/services':(context)=>const Services(),
        '/serviceInfoBuild':(context)=>const ServiceInfo(text: 'Строительство'),
        '/serviceInfoInterier':(context)=>const ServiceInfo(text: 'Дизайн интерьера'),
        '/serviceInfoRemont':(context)=>const ServiceInfo(text: 'Ремонт и отделка'),
        '/serviceInfoLandshaft':(context)=>const ServiceInfo(text: 'Ландшафтный дизайн'),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity,fontFamily: 'Comfortaa',scaffoldBackgroundColor: const Color(0xffede0d4)),
    );
  }


}
