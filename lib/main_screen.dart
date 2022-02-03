import 'package:flutter/material.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/appBar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/widgetImages.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      drawer: SizeWidget.isSmallScreen(context) ? const MyDrawer() : null,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: SizeWidget.isPhoneScreen(context)?SmallAppBar(opacity: _opacity):PrefSizeAppBar(
                opacity: _opacity,
              )),
      body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  const MainImage(),
                  Container(
                    width: screenSize.width,
                      height: screenSize.height/3,
                      margin:  EdgeInsets.only(
                          left: 1, top: screenSize.height*0.3),
                      child: Image.asset(
                        'assets/logo1.png',
                        color: Colors.black.withOpacity(0.3),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
