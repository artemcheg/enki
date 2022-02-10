import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/carousel.dart';
import 'package:web_site/widgets/drawer.dart';

import '../widgets/SizeWidget.dart';
import '../widgets/appBar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/rich_text.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.1),
      extendBodyBehindAppBar: true,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          trackVisibility: true,
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (SizeWidget.isSmallScreen(context)) {
                      return const ContactsSmall();
                    } else {
                      return const ContactsLarge();
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: BottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactsLarge extends StatefulWidget {
  const ContactsLarge({Key? key}) : super(key: key);

  @override
  _ContactsLargeState createState() => _ContactsLargeState();
}

class _ContactsLargeState extends State<ContactsLarge> {
  final _isHovering = [false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrefSizeAppBar(
                shadow: null,
                colorText: Colors.black,
                colorDrawer: Colors.blue,
              ),
        Container(
          alignment: Alignment.centerLeft,
          width: screenSize.width,
          height: 50,
          padding: const EdgeInsets.all(10),
          color: Colors.black.withOpacity(0.1),
          child: const Text(
            'Контакты',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      'Телефоны:',
                      style: TextStyle(
                          fontSize: sizeParam(screenSize.width, 0.015, 18)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyRichText(
                      fontFamily: 'Oswald',
                      shadow: null,
                      colorText: Colors.black,
                      isHovering: _isHovering[0],
                      text: StringRes.phone,
                      sizeParam: sizeParam(screenSize.width, 0.008, 10),
                      maxLines: 2,
                      what: 'tel:${StringRes.phone}',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Почта:',
                      style: TextStyle(
                          fontSize: sizeParam(screenSize.width, 0.015, 18)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyRichText(
                      fontFamily: 'Oswald',
                      shadow: null,
                      colorText: Colors.black,
                      isHovering: _isHovering[1],
                      text: StringRes.mail,
                      sizeParam: sizeParam(screenSize.width, 0.008, 10),
                      what: 'mailto:${StringRes.mail}',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      "Адрес:",
                      style: TextStyle(
                          fontSize: sizeParam(screenSize.width, 0.015, 18)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyRichText(
                      fontFamily: 'Oswald',
                      shadow: null,
                      colorText: Colors.black,
                      isHovering: _isHovering[2],
                      text: StringRes.address,
                      sizeParam: sizeParam(screenSize.width, 0.008, 10),
                      maxLines: 5,
                      what:
                          'https://yandex.ru/maps/146/simferopol/house/ulitsa_turgeneva_13a/Z00YdwZkTEEAQFpufXV0cHRkZw==/?from=tabbar&ll=34.114722%2C44.951856&source=serp_navig&z=20',
                      webOnlyWindowName: '_blank',
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      'Время работы:',
                      style: TextStyle(
                          fontSize: sizeParam(screenSize.width, 0.015, 18)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelectableText(
                      'пн-пт: с 9:00 до 18:00',
                      style: TextStyle(
                        fontSize: sizeParam(screenSize.width, 0.008, 10),
                        fontFamily: 'Oswald',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SelectableText('сб-вс: выходной',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: sizeParam(screenSize.width, 0.008, 10))),

                  ],
                ),
              ),
              // FittedBox(
              //   fit: BoxFit.contain,
              //   child: Image.asset(
              //     'assets/office.jpg',
              //     width: screenSize.width*0.5,
              //     height: screenSize.width*0.3,
              //   ),
              // ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            width: screenSize.width,
            height: 50,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.1),
            child: const Text('Наш офис',
                style: TextStyle(
                    fontSize: 30))),

        const Carousel(),
      ],
    );
  }
}

class ContactsSmall extends StatefulWidget {
  const ContactsSmall({Key? key}) : super(key: key);

  @override
  _ContactsSmallState createState() => _ContactsSmallState();
}

class _ContactsSmallState extends State<ContactsSmall> {
  final _isHovering = [false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         const SmallAppBar(
                colorText: Colors.black,
                shadow: null,
                colorDrawer: Colors.blue,
              ),
        Container(
            alignment: Alignment.centerLeft,
            width: screenSize.width,
            height: 50,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.1),
            child: const Text('Контакты',textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30))),
        Column(
          children: [
            const Text(
              'Телефоны:',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            MyRichText(
              fontFamily: 'Oswald',
              shadow: null,
              colorText: Colors.black,
              isHovering: _isHovering[0],
              text: StringRes.phone,
              sizeParam: 15,
              maxLines: 2,
              what: 'tel:${StringRes.phone}',
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Почта:',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            MyRichText(
              fontFamily: 'Oswald',
              shadow: null,
              colorText: Colors.black,
              isHovering: _isHovering[1],
              text: StringRes.mail,
              sizeParam: 15,
              what: 'mailto:${StringRes.mail}',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: [
            const Text(
              "Адрес:",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            MyRichText(
              fontFamily: 'Oswald',
              shadow: null,
              colorText: Colors.black,
              isHovering: _isHovering[2],
              text: StringRes.address,
              sizeParam: 15,
              maxLines: 5,
              what:
                  'https://yandex.ru/maps/146/simferopol/house/ulitsa_turgeneva_13a/Z00YdwZkTEEAQFpufXV0cHRkZw==/?from=tabbar&ll=34.114722%2C44.951856&source=serp_navig&z=20',
              webOnlyWindowName: '_blank',
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: const [
            Text(
              'Время работы:',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'пн-пт: с 9:00 до 18:00',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('сб-вс: выходной',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 15))
          ],
        ),
        Container(
            alignment: Alignment.centerLeft,
            width: screenSize.width,
            height: 50,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.1),
            child: const Text('Наш офис',textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30))),
        const Carousel(),
      ],
    );
  }
}
