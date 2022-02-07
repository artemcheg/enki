import 'package:flutter/material.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/text_info.dart';
import 'package:web_site/widgets/widgetImages.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  // double _scrollPosition = 0;
  // double _opacity = 0;

  // _scrollListener() {
  //   setState(() {
  //     _scrollPosition = _scrollController.position.pixels;
  //   });
  // }

  // @override
  // void initState() {
  //   _scrollController.addListener(_scrollListener);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // _opacity = _scrollPosition < screenSize.height * 0.40
    //     ? _scrollPosition / (screenSize.height * 0.40)
    //     : 1;

    return Scaffold(
      drawer: SizeWidget.isSmallScreen(context) ? const MyDrawer() : null,
      extendBodyBehindAppBar: true,

      // appBar: PreferredSize(
      //         preferredSize: Size(screenSize.width, 1000),
      //         child: SizeWidget.isPhoneScreen(context)?SmallAppBar(opacity: _opacity):PrefSizeAppBar(
      //           opacity: _opacity,
      //         )),
      body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const MainImage(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(height: screenSize.height*0.25,
              //       alignment: Alignment.center,
              //       child: RichText(
              //         textAlign: TextAlign.center,
              //           text:  TextSpan(text: '999+', style: TextStyle(fontSize: sizeParam(screenSize.width, 0.04, 20)), children: [
              //         TextSpan(text: '\nПроектов выполнено',style: TextStyle(fontSize: sizeParam(screenSize.width, 0.02, 15))),
              //       ])),
              //     ),
              //     Container(
              //       height: screenSize.height*0.25,
              //       alignment: Alignment.center,
              //       child: RichText(
              //           textAlign: TextAlign.center,
              //           text:  TextSpan(text: '999+', style: TextStyle(fontSize: sizeParam(screenSize.width, 0.04, 20)), children: [
              //             TextSpan(text: '\nПроектов выполнено',style: TextStyle(fontSize: sizeParam(screenSize.width, 0.02, 15))),
              //           ])),
              //     ),
              //     Container(
              //       height: screenSize.height*0.25,
              //       alignment: Alignment.center,
              //       child: RichText(
              //           textAlign: TextAlign.center,
              //           text:  TextSpan(text: '999+', style: TextStyle(fontSize: sizeParam(screenSize.width, 0.04, 20)), children: [
              //             TextSpan(text: '\nПроектов выполнено',style: TextStyle(fontSize: sizeParam(screenSize.width, 0.02, 15))),
              //           ])),
              //     ),
              //   ],
              // )
              GridView.count(
                childAspectRatio: SizeWidget.isPhoneScreen(context)
                    ? screenSize.width / screenSize.height / 0.5
                    : screenSize.width / screenSize.height,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  TextInfoWidget(
                    text1: '999+',
                    text2: 'Проектов реализовано',
                    border: Border(
                        right:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                  TextInfoWidget(
                    text1: '999+',
                    text2: 'Проектов реализовано',
                    border: Border(
                        right:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                  TextInfoWidget(
                    text1: '10 лет',
                    text2: 'Безупречного опыта',
                    border: Border(
                        right:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
