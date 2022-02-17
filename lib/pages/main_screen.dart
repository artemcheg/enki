import 'package:flutter/material.dart';
import 'package:web_site/animation/direction.dart';
import 'package:web_site/animation/scroll_animation.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/appBar.dart';
import 'package:web_site/widgets/bottom_bar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/interactive.dart';
import 'package:web_site/widgets/text_info.dart';
import 'package:web_site/widgets/widgetImages.dart';
import '../widgets/map.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _isHovering = [false];
  final parentKey = GlobalKey();
  final childKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = true;

  @override
  void initState() {
    // _scrollController.addListener((){s();});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: SizeWidget.isSmallScreen(context) ? const MyDrawer() : null,
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          trackVisibility: true,
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: SingleChildScrollView(
              key: parentKey,
              controller: _scrollController,
              physics: isScrolling
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const MainImage(),
                      SizeWidget.isPhoneScreen(context)
                          ? const SmallAppBar()
                          : const PrefSizeAppBar(
                              dividerColor: Colors.white54,
                            ),
                    ],
                  ),
                  GridView.count(
                    childAspectRatio: SizeWidget.isSmallScreen(context)
                        ? screenSize.width / screenSize.height / 0.5
                        : screenSize.width / screenSize.height / 0.7,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: [
                      TextInfoWidget(
                        text1: '999+',
                        text2: 'Проектов реализовано',
                        scrollController: _scrollController,
                        parentKey: parentKey,
                      ),
                      TextInfoWidget(
                        text1: '999+',
                        text2: 'Проектов реализовано',
                        scrollController: _scrollController,
                        parentKey: parentKey,
                        durationStart: const Duration(milliseconds: 200),
                      ),
                      TextInfoWidget(
                        text1: '10 лет',
                        text2: 'Безупречного опыта',
                        scrollController: _scrollController,
                        parentKey: parentKey,
                        durationStart: const Duration(milliseconds: 400),
                      ),
                    ],
                  ),
                  ScrollAnimation(
                    direct: Direct.horizontal,
                    animTime: const Duration(seconds: 2),
                    curve: Curves.easeOutQuart,
                    parentKey: parentKey,
                    scrollController: _scrollController,
                    child: Container(
                        key: childKey,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringRes.aboutShort,
                              style: TextStyle(
                                  fontSize: SizeWidget.isSmallScreen(context)
                                      ? 15
                                      : sizeParam(screenSize.width, 0.015, 25),
                                  fontStyle: FontStyle.italic),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              child: InkWell(
                                hoverColor: Colors.grey.withOpacity(0),
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    _isHovering[0] = value;
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ПОДРОБНЕЕ О КОМПАНИИ',
                                      style: TextStyle(
                                          fontSize:
                                              SizeWidget.isSmallScreen(context)
                                                  ? 10
                                                  : 15,
                                          color: _isHovering[0]
                                              ? const Color(0XFF52B060)
                                              : Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 4, left: 5),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: _isHovering[0]
                                            ? const Color(0XFF52B060)
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: InterActiveWidget(),
                  ),
                  // InkWell(
                  //     onTap: () {},
                  //     onHover: (value) {
                  //       setState(() {
                  //         isScrolling = !value;
                  //       });
                  //     },
                  //     child: myMap(screenSize.width, screenSize.height * 0.6)),
                  MouseRegion(
                    onHover: (value){setState(() {
                      isScrolling = false;
                    });},
                    onExit: (value){setState(() {
                      isScrolling = true;
                    });},
                    child: GestureDetector(
                      onVerticalDragCancel: (){
                        setState(() {
                        isScrolling = true;
                      });},
                      onVerticalDragUpdate: (d){setState(() {
                        isScrolling = false;
                      });},
                      onVerticalDragEnd: (d){setState(() {
                        isScrolling = true;
                      });},
                      onVerticalDragStart: (d){setState(() {
                        isScrolling = false;
                      });},
                      onHorizontalDragEnd: (d){setState(() {
                        isScrolling = true;
                      });},
                      onHorizontalDragCancel: (){setState(() {
                        isScrolling = true;
                      });},
                      onHorizontalDragUpdate: (d){setState(() {
                        isScrolling = false;
                      });},
                      onHorizontalDragStart: (d) {setState(() {
                        isScrolling = false;
                      });},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal:SizeWidget.isSmallScreen(context)?0:20),
                        child: myMap(screenSize.width,SizeWidget.isSmallScreen(context)?screenSize.height*0.7:screenSize.height * 0.6),
                      ),
                    ),
                  ),
                  const BottomBar(),
                ],
              )),
        ),
      ),
    );
  }
}