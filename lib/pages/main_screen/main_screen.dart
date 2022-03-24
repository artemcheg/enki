import 'package:flutter/material.dart';
import 'package:web_site/animation/direction.dart';
import 'package:web_site/animation/scroll_animation.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/appBar.dart';
import 'package:web_site/widgets/bottom_bar.dart';
import 'package:web_site/widgets/drawer.dart';
import 'package:web_site/pages/main_screen/interactive.dart';
import 'package:web_site/pages/main_screen/text_info.dart';
import 'package:web_site/pages/main_screen/widgetImages.dart';
import 'map.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _isHovering = [false];
  final parentKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool isScrolling = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: SizeWidget.isLargeScreen(context) ? null : const MyDrawer(),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          trackVisibility: true,
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: ListView(
            controller: _scrollController,
            key: parentKey,
            children: [
              Stack(
                children: [
                  const MainImage(),
                  SizeWidget.isPhoneScreen(context)
                      ? const SmallAppBar(
                          backGround: Colors.transparent,
                        )
                      : PrefSizeAppBar(
                          backGround: Colors.transparent,
                          dividerColor: Colors.white54,
                        ),
                ],
              ),
              WidgetWithBest(
                  screenSize: screenSize,
                  scrollController: _scrollController,
                  parentKey: parentKey),
              ScrollAnimation(
                direct: Direct.horizontal,
                animTime: const Duration(seconds: 2),
                curve: Curves.easeOutQuart,
                parentKey: parentKey,
                scrollController: _scrollController,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
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
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: InkWell(
                            hoverColor: Colors.grey.withOpacity(0),
                            onTap: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            onHover: (value) {
                              setState(() {
                                _isHovering[0] = value;
                              });
                            },
                            child: RepaintBoundary(
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
                        ),
                      ],
                    )),
              ),

              const InteractiveWidget(),

              //Карта
              MouseRegion(
                onHover: (value) {
                  setState(() {
                    isScrolling = false;
                  });
                },
                onExit: (value) {
                  setState(() {
                    isScrolling = true;
                  });
                },
                child: GestureDetector(
                  onVerticalDragCancel: () {
                    setState(() {
                      isScrolling = true;
                    });
                  },
                  onVerticalDragUpdate: (d) {
                    setState(() {
                      isScrolling = false;
                    });
                  },
                  onVerticalDragEnd: (d) {
                    setState(() {
                      isScrolling = true;
                    });
                  },
                  onVerticalDragStart: (d) {
                    setState(() {
                      isScrolling = false;
                    });
                  },
                  onHorizontalDragEnd: (d) {
                    setState(() {
                      isScrolling = true;
                    });
                  },
                  onHorizontalDragCancel: () {
                    setState(() {
                      isScrolling = true;
                    });
                  },
                  onHorizontalDragUpdate: (d) {
                    setState(() {
                      isScrolling = false;
                    });
                  },
                  onHorizontalDragStart: (d) {
                    setState(() {
                      isScrolling = false;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: RepaintBoundary(
                        child: myMap(
                            screenSize.width,
                            SizeWidget.isSmallScreen(context)
                                ? screenSize.height * 0.7
                                : screenSize.height * 0.6)),
                  ),
                ),
              ),
              const BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetWithBest extends StatelessWidget {
  WidgetWithBest({
    Key? key,
    required this.screenSize,
    required ScrollController scrollController,
    required this.parentKey,
  })  : _scrollController = scrollController,
        super(key: key);

  final Size screenSize;
  final ScrollController _scrollController;
  final GlobalKey<State<StatefulWidget>> parentKey;

  final List<_TextInfoWidgetText> listInfo = [
    const _TextInfoWidgetText(
        '999+', 'Проектов реализовано', Duration(seconds: 0)),
    const _TextInfoWidgetText(
        '999+', 'Проектов реализовано', Duration(milliseconds: 200)),
    const _TextInfoWidgetText(
        '10 лет', 'Безупречного опыта', Duration(milliseconds: 400)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: SizeWidget.isSmallScreen(context)
          ? screenSize.width / screenSize.height / 0.5
          : screenSize.width / screenSize.height / 0.7,
      shrinkWrap: true,
      crossAxisCount: 3,
      children: listInfo
          .map((e) => TextInfoWidget(
                text1: e.textTitle,
                text2: e.textSubtitle,
                scrollController: _scrollController,
                parentKey: parentKey,
                durationStart: e.duration,
              ))
          .toList(),
    );
  }
}

class _TextInfoWidgetText {
  final String textTitle;
  final String textSubtitle;
  final Duration duration;

  const _TextInfoWidgetText(this.textTitle, this.textSubtitle, this.duration);
}
