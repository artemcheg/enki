import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/small_changes.dart';
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
            return const AboutSmall();
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
    return SingleChildScrollView(
      child: Column(
        children: [
          PrefSizeAppBar(
            shadow: null,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.center,
                    child: _TextItems(
                      text: StringRes.aboutFullZero,
                      fontSize: sizeParam(width, 0.015, 20),
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(
                  height: 30,
                ),
                GridView.count(
                  clipBehavior: Clip.none,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: const [
                    ImageLarge(
                        assetOne: 'assets/about/0.jpg',
                        assetTwo: 'assets/about/00.jpg'),
                    _MyText(
                      textMain: StringRes.aboutFullOne,
                      textTitle: 'Наши приоритеты',
                    ),
                    _MyText(
                      textMain: StringRes.aboutFullTwo,
                      textTitle: 'Уникальность компании «ENKI»',
                    ),
                    ImageLarge(
                        assetOne: 'assets/about/1.jpg',
                        assetTwo: 'assets/about/2.jpg'),
                    ImageLarge(
                      assetOne: 'assets/about/3.jpeg',
                      assetTwo: null,
                    ),
                    _MyText(
                      textMain: StringRes.aboutFullThree,
                      textTitle: 'Индивидуальный подход к каждому',
                    ),
                    _MyText(
                      textMain: StringRes.aboutFullFour,
                      textTitle: 'Пунктуальность',
                    ),
                    ImageLarge(
                      assetOne: 'assets/about/4.jpg',
                      assetTwo: null,
                    ),
                    ImageLarge(
                      assetOne: 'assets/about/5.jpg',
                      assetTwo: null,
                    ),
                    _MyText(
                      textMain: StringRes.aboutFullEleven,
                      textTitle: 'Наша визитная карточка',
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: _TextItems(
                    text: StringRes.aboutFullFive,
                    fontSize: sizeParam(width, 0.015, 20),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 30),
                _TextItems(
                  text: '1. ${StringRes.aboutFullSix}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '2. ${StringRes.aboutFullSeven}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '3. ${StringRes.aboutFullEight}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '4. ${StringRes.aboutFullNine}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 50),
                _TextItems(
                  text: StringRes.aboutFullTen,
                  align: TextAlign.center,
                  fontSize: sizeParam(width, 0.015, 20),
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}

class _TextItems extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;

  const _TextItems({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.align = TextAlign.justify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
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
        ));
  }
}

class AboutSmall extends StatelessWidget {
  const AboutSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SmallAppBar(
            shadow: null,
            colorDrawer: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: _TextItems(
                      text: StringRes.aboutFullZero,
                      fontSize: sizeParam(width, 0.015, 20),
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const _MyText(
                  textMain: StringRes.aboutFullOne,
                  textTitle: 'Наши приоритеты',
                ),
                const ImageSmall(
                    assetOne: "assets/about/0.jpg",
                    assetTwo: "assets/about/00.jpg"),
                const SizedBox(
                  height: 20,
                ),
                const _MyText(
                  textMain: StringRes.aboutFullTwo,
                  textTitle: 'Уникальность компании «ENKI»',
                ),
                const ImageSmall(
                    assetOne: 'assets/about/1.jpg',
                    assetTwo: "assets/about/2.jpg"),
                const SizedBox(
                  height: 20,
                ),
                const _MyText(
                  textMain: StringRes.aboutFullThree,
                  textTitle: 'Индивидуальный подход к каждому',
                ),
                const ImageSmall(
                    assetOne: 'assets/about/3.jpeg', assetTwo: null),
                const SizedBox(
                  height: 20,
                ),
                const _MyText(
                  textMain: StringRes.aboutFullFour,
                  textTitle: 'Пунктуальность',
                ),
                const ImageSmall(
                    assetOne: 'assets/about/4.jpg', assetTwo: null),
                const SizedBox(
                  height: 20,
                ),
                const _MyText(
                  textMain: StringRes.aboutFullEleven,
                  textTitle: 'Наша визитная карточка',
                ),
                const ImageSmall(
                    assetOne: 'assets/about/5.jpg', assetTwo: null),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: _TextItems(
                    text: StringRes.aboutFullFive,
                    fontSize: sizeParam(width, 0.015, 20),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 30),
                _TextItems(
                  text: '1. ${StringRes.aboutFullSix}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '2. ${StringRes.aboutFullSeven}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '3. ${StringRes.aboutFullEight}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                _TextItems(
                  text: '4. ${StringRes.aboutFullNine}',
                  fontSize: sizeParam(width, 0.01, 14),
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                _TextItems(
                  text: StringRes.aboutFullTen,
                  align: TextAlign.center,
                  fontSize: sizeParam(width, 0.015, 20),
                  fontWeight: FontWeight.w800,
                ),
              ],
            ),
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}

class ImageLarge extends StatelessWidget {
  final String assetOne;
  final String? assetTwo;

  const ImageLarge({Key? key, required this.assetOne, required this.assetTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: shadowBox,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: assetTwo == null
            ? Image.asset(
                assetOne,
              )
            : Row(
                children: [
                  Image.asset(
                    assetOne,
                  ),
                  Image.asset(
                    assetTwo!,
                  ),
                ],
              ),
      ),
    );
  }
}

class ImageSmall extends StatelessWidget {
  final String assetOne;
  final String? assetTwo;

  const ImageSmall({Key? key, required this.assetOne, required this.assetTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width * 0.825,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: shadowBox,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: assetTwo == null
            ? Image.asset(assetOne)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: width * 0.55,
                      child: Image.asset(
                        assetOne,
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                      height: width * 0.55,
                      child: Image.asset(
                        assetTwo!,
                        fit: BoxFit.contain,
                      )),
                ],
              ),
      ),
    );
  }
}
