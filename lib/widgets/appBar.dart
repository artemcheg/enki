import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/menu_item.dart';
import 'package:web_site/widgets/rich_text.dart';
import 'package:web_site/widgets/small_changes.dart';
import 'SizeWidget.dart';

class PrefSizeAppBar extends StatefulWidget {
  final double opacity;

  const PrefSizeAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  _PrefSizeAppBarState createState() => _PrefSizeAppBarState();
}

class _PrefSizeAppBarState extends State<PrefSizeAppBar> {
  final List _isHovering = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/logo.png',
                            width: sizeParam(screenSize.width, 0.1, 100),
                            height: sizeParam(screenSize.width, 0.03, 50),
                            color: Colors.amberAccent,
                          )),
                    ),
                    SizedBox(width: screenSize.width * 0.008),
                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      indent: 10,
                      endIndent: 7,
                      color: Colors.white54,
                    ),
                    SizedBox(width: screenSize.width * 0.008),
                    const Text(
                      'Крымская\nстроительная\nкомпания',
                      style: TextStyle(color: Colors.white54, fontSize: 14,shadows: shadowList),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.amberAccent,
                        size: sizeParam(screenSize.width, 0.01, 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      MyRichText(
                        isHovering: _isHovering[4],
                        text: StringRes.phone,
                        sizeParam: 14,
                        what: 'tel:${StringRes.phone}',
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.width * 0.0015,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail_rounded,
                        size: sizeParam(screenSize.width, 0.01, 20),
                        color: Colors.amberAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      MyRichText(
                        isHovering: _isHovering[5],
                        text: StringRes.mail,
                        sizeParam: 14,
                        what: 'mailto:${StringRes.mail}',
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_forwarded,
                    color: Colors.amberAccent,
                    size: sizeParam(screenSize.width, 0.01, 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Нужна консультация?',
                        style: TextStyle(color: Colors.white, fontSize: 14,shadows: shadowList),
                      ),
                      const Text('Мы перезвоним!',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14,shadows: shadowList)),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[6] = value;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          children: [
                            const Text('Заказать обратный звонок',
                                style: TextStyle(
                                    color: Color(0XFF52B060), fontSize: 14,shadows: shadowList)),
                            AnimatedContainer(
                              color: Colors.red,
                              duration: const Duration(
                                milliseconds: 100,
                              ),
                              child: SizedBox(
                                height: 2,
                                width: screenSize.width * 0.1,
                              ),
                              width: _isHovering[6] ? 50 : 215,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          SizeWidget.isSmallScreen(context)
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MenuItem(isHovering: _isHovering[0], text: 'ГЛАВНАЯ'),
                    MenuItem(isHovering: _isHovering[1], text: 'УСЛУГИ'),
                    MenuItem(isHovering: _isHovering[2], text: 'НАШИ ПРОЕКТЫ'),
                    MenuItem(isHovering: _isHovering[3], text: 'КОНТАКТЫ'),
                  ],
                ),
          SizeWidget.isSmallScreen(context)
              ? Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        'МЕНЮ',
                        style: TextStyle(color: Colors.white,shadows: shadowList),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.view_headline_sharp),
                      color: Colors.white,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class SmallAppBar extends StatefulWidget {
  final double opacity;

  const SmallAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  _SmallAppBarState createState() => _SmallAppBarState();
}

class _SmallAppBarState extends State<SmallAppBar> {
  final List _isHovering = [false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.view_headline_sharp),
                color: Colors.white,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/logo.png',
                  color: Colors.amberAccent,
                  width: 200,
                  height: 100,
                )),
            const SizedBox.shrink(),
          ],
        ),

        Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction:screenSize.height<360?Axis.horizontal:Axis.vertical,
          children: [
            Flex(
              direction: screenSize.width<690?Axis.vertical:Axis.horizontal,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MyRichText(
                      isHovering: _isHovering[0],
                      text: StringRes.phone,
                      sizeParam: 13,
                      what: 'tel:${StringRes.phone}',
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.mail_rounded,
                      color: Colors.amberAccent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MyRichText(
                      isHovering: _isHovering[1],
                      text: StringRes.mail,
                      sizeParam: 13,
                      what: 'mailto:${StringRes.mail}',
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.phone_forwarded,
                  color: Colors.amberAccent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Нужна консультация?',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                          shadows: shadowList
                      ),
                    ),
                     const Text('Мы перезвоним!',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                            shadows: shadowList,
                        )),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[2] = value;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        children: [
                           const Text('Заказать обратный звонок',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0XFF52B060),
                                  shadows: shadowList
                              )),
                          AnimatedContainer(
                            color: Colors.red,
                            duration: const Duration(
                              milliseconds: 100,
                            ),
                            child: SizedBox(
                              height: 2,
                              width: screenSize.width * 0.2,
                            ),
                            width: _isHovering[2] ? 50 : 200,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        //
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
