import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
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
  final List _isHovering = [false];

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
    return Scaffold(
      drawer: SizeWidget.isSmallScreen(context) ? const MyDrawer() : null,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const MainImage(),
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
                        right: BorderSide(color: Colors.black.withOpacity(0.1)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                  TextInfoWidget(
                    text1: '999+',
                    text2: 'Проектов реализовано',
                    border: Border(
                        right: BorderSide(color: Colors.black.withOpacity(0.1)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                  TextInfoWidget(
                    text1: '10 лет',
                    text2: 'Безупречного опыта',
                    border: Border(
                        right: BorderSide(color: Colors.black.withOpacity(0.1)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.1))),
                  ),
                ],
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringRes.aboutShort,
                        style: TextStyle(
                            fontSize:sizeParam(screenSize.width, 0.015, 25), fontStyle: FontStyle.italic),
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
                                    color: _isHovering[0]
                                        ? const Color(0XFF52B060)
                                        : Colors.black),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 4, left: 5),
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
                      AnimatedContainer(
                        color: const Color(0XFF52B060),
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        child: const SizedBox(
                          height: 2,
                        ),
                        width: _isHovering[0]
                            ? 25
                            : 240,
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
