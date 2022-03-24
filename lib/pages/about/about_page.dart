import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';

import '../../widgets/appBar.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/drawer.dart';

class AboutMain extends StatelessWidget {
  const AboutMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (SizeWidget.isSmallScreen(context)) {
            return Container();
          } else {
            return const About();
          }
        },
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
              child: SizeWidget.isSmallScreen(context)
                  ? const SmallAppBar(
                      shadow: null,
                      colorDrawer: Colors.white,
                    )
                  : PrefSizeAppBar(
                      dividerColor: Colors.white54,
                    ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                   Align(
                      alignment: Alignment.center,
                      child: _TextItems(
                        text: StringRes.aboutFullZero, fontSize: sizeParam(width, 0.015, 20), fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // crossAxisSpacing:50,
                    mainAxisSpacing: SizeWidget.isSmallScreen(context) ? 50 : 0,
                    crossAxisCount: SizeWidget.isSmallScreen(context) ? 1 : 2,
                    childAspectRatio: 1.5,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/about/0.jpg"),
                          Image.asset("assets/about/00.jpg"),
                        ],
                      ),
                      const _MyText(
                        textMain: StringRes.aboutFullOne,
                        textTitle: 'Наши приоритеты',
                      ),
                      const _MyText(
                        textMain: StringRes.aboutFullTwo,
                        textTitle: 'Уникальность компании «ENKI»',
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/about/1.jpg',
                          ),
                          Image.asset(
                            'assets/about/2.jpg',
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/about/3.jpeg',
                      ),
                      const _MyText(
                        textMain: StringRes.aboutFullThree,
                        textTitle: 'Индивидуальный подход к каждому',
                      ),
                      const _MyText(
                        textMain: StringRes.aboutFullFour,
                        textTitle: 'Пунктуальность',
                      ),
                      Image.asset(
                        'assets/about/4.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                   Align(
                    alignment: Alignment.center,
                    child: _TextItems(
                      text: StringRes.aboutFullFive, fontSize: sizeParam(width, 0.015, 20), fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _TextItems(text: '1. ${StringRes.aboutFullSix}', fontSize: sizeParam(width, 0.01,14), fontWeight: FontWeight.w600,),
                  const SizedBox(height: 15),
                  _TextItems(text: '2. ${StringRes.aboutFullSeven}', fontSize: sizeParam(width, 0.01,14), fontWeight: FontWeight.w600,),
                  const SizedBox(height: 15),
                  _TextItems(text: '3. ${StringRes.aboutFullEight}', fontSize: sizeParam(width, 0.01,14), fontWeight: FontWeight.w600,),
                  const SizedBox(height: 15),
                  _TextItems(text: '4. ${StringRes.aboutFullNine}', fontSize: sizeParam(width, 0.01,14), fontWeight: FontWeight.w600,),

                  const SizedBox(height: 30),
                   _TextItems(text: StringRes.aboutFullTen, fontSize: sizeParam(width, 0.015, 20), fontWeight: FontWeight.w800,),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _TextItems extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const _TextItems({
    Key? key,
    required this.text, required this.fontSize, required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class _MyText extends StatelessWidget {
  final String textMain;
  final String textTitle;

  const _MyText({
    Key? key,
    required this.textMain,
    required this.textTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.center,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textTitle,
                style: TextStyle(
                    fontSize: sizeParam(width, 0.015, 20),
                    fontFamily: 'Comfortaa',
                    height: 1.2,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(textMain,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: sizeParam(width, 0.01, 14),
                      fontFamily: 'Comfortaa',
                      height: 1.2,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ));
  }
}
