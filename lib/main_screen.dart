import 'package:flutter/material.dart';
import 'package:web_site/animation/direction.dart';
import 'package:web_site/animation/scroll_animation.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/bottom_bar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/widgets/interactive.dart';
import 'package:web_site/widgets/text_info.dart';
import 'package:web_site/widgets/widgetImages.dart';

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
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
            key: parentKey,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const MainImage(),
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
                      border: Border(
                          right:
                              BorderSide(color: Colors.black.withOpacity(0.1)),
                          bottom:
                              BorderSide(color: Colors.black.withOpacity(0.1))),
                      scrollController: _scrollController,
                      parentKey: parentKey,
                    ),
                    TextInfoWidget(
                      text1: '999+',
                      text2: 'Проектов реализовано',
                      border: Border(
                          right:
                              BorderSide(color: Colors.black.withOpacity(0.1)),
                          bottom:
                              BorderSide(color: Colors.black.withOpacity(0.1))),
                      scrollController: _scrollController,
                      parentKey: parentKey,
                      durationStart: const Duration(milliseconds: 200),
                    ),
                    TextInfoWidget(
                      text1: '10 лет',
                      text2: 'Безупречного опыта',
                      border: Border(
                          right:
                              BorderSide(color: Colors.black.withOpacity(0.1)),
                          bottom:
                              BorderSide(color: Colors.black.withOpacity(0.1))),
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
                            padding: const EdgeInsets.only(top: 10),
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
                const InterActiveWidget(),
                // getMap(screenSize.height/2,screenSize.width/2),
                const BottomBar(),
              ],
            )),
      ),
    );
  }
}
