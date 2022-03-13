import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/menu_item.dart';
import 'package:web_site/widgets/rich_text.dart';
import 'package:web_site/widgets/small_changes.dart';
import 'package:web_site/widgets/social_widget.dart';
import 'SizeWidget.dart';

class PrefSizeAppBar extends StatelessWidget {
  final Color colorDrawer;
  final Color colorText;
  final List<Shadow>? shadow;
  final Color dividerColor;
  final Color backGround;

  PrefSizeAppBar(
      {Key? key,
      this.colorDrawer = Colors.white,
      this.colorText = Colors.white,
      this.shadow = shadowList,
      this.dividerColor = Colors.black54,
      this.backGround = const Color(0xff263238)})
      : super(key: key);

  final List items = [
    const MenuItems('ГЛАВНАЯ', '/'),
    const MenuItems('УСЛУГИ', '/services'),
    const MenuItems('НАШИ ПРОЕКТЫ', '/'),
    const MenuItems('О НАС', '/'),
    const MenuItems('КОНТАКТЫ', '/contacts'),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: backGround,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                            hoverColor: Colors.grey.withOpacity(0),
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Image.asset(
                              'assets/logo.png',
                              width: sizeParam(screenSize.width, 0.1, 100),
                              height: sizeParam(screenSize.width, 0.03, 50),
                              color: Colors.amberAccent,
                            )),
                      ),
                      SizedBox(width: screenSize.width * 0.008),
                      VerticalDivider(
                        width: 1,
                        thickness: 1,
                        indent: 10,
                        endIndent: 7,
                        color: dividerColor,
                      ),
                      SizedBox(width: screenSize.width * 0.008),
                      Text(
                        'Крымская\nстроительная\nкомпания',
                        style: TextStyle(
                            color: colorText, fontSize: 15, shadows: shadow),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Мы в социальных сетях:',
                      style: TextStyle(
                          color: colorText, shadows: shadow, fontSize: 15),
                    ),
                    const SocialWidget(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          colorText: colorText,
                          text: StringRes.phone,
                          sizeParam: 15,
                          what: 'tel:${StringRes.phone}',
                          shadow: shadow,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                          colorText: colorText,
                          text: StringRes.phoneSecond,
                          sizeParam: 15,
                          what: 'tel:${StringRes.phoneSecond}',
                          shadow: shadow,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
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
                          colorText: colorText,
                          text: StringRes.mail,
                          shadow: shadow,
                          sizeParam: 15,
                          what: 'mailto:${StringRes.mail}',
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizeWidget.isSmallScreen(context)
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: items
                        .map((e) => MenuItem(
                              items: e,
                              colorText: colorText,
                              shadow: shadow,
                            ))
                        .toList(),
                  ),
            SizeWidget.isSmallScreen(context)
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'МЕНЮ',
                          style: TextStyle(color: colorDrawer, shadows: shadow),
                        ),
                      ),
                      IconButton(
                        hoverColor: Colors.white.withOpacity(0),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.view_headline_sharp),
                        color: colorDrawer,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class SmallAppBar extends StatelessWidget {
  final Color colorDrawer;
  final Color colorText;
  final List<Shadow>? shadow;
  final Color backGround;

  const SmallAppBar(
      {Key? key,
      this.colorDrawer = Colors.white,
      this.colorText = Colors.white,
      this.shadow,
      this.backGround = const Color(0xff263238)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backGround,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              hoverColor: Colors.white.withOpacity(0),
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.view_headline_sharp),
              color: colorDrawer,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/logo.png',
                  color: Colors.amberAccent,
                  width: 200,
                  height: 100,
                )),
            const SizedBox.shrink()
          ],
        ));
  }
}

class PrefSizeAppBar2 extends StatelessWidget {
  final Color colorDrawer;
  final Color colorText;
  final List<Shadow>? shadow;
  final Color dividerColor;
  final Color backGround;

  PrefSizeAppBar2(
      {Key? key,
      this.colorDrawer = Colors.white,
      this.colorText = Colors.white,
      this.shadow = shadowList,
      this.dividerColor = Colors.black54,
      this.backGround = const Color(0xff263238)})
      : super(key: key);

  final List items = [
    const MenuItems('ГЛАВНАЯ', '/'),
    const MenuItems('УСЛУГИ', '/services'),
    const MenuItems('НАШИ ПРОЕКТЫ', '/'),
    const MenuItems('О НАС', '/'),
    const MenuItems('КОНТАКТЫ', '/contacts'),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: backGround,
      child: Padding(
        padding: const EdgeInsets.only(top: 35,left: 20,right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizeWidget.isLargeScreen(context)?_LargeAppBarRow(screenSize: screenSize, dividerColor: dividerColor, colorText: colorText, shadow: shadow, items: items):
            _SmallAppBarRow(screenSize: screenSize, dividerColor: dividerColor, colorText: colorText, shadow: shadow, items: items),
            const SizedBox(
              height: 30,
            ),
            SizeWidget.isLargeScreen(context)?
            const SizedBox.shrink():
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            'МЕНЮ',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: colorDrawer, shadows: shadow),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Icon(Icons.view_headline_sharp,color: colorDrawer,),
                      ],
                    ),
                )
                ,
          ],
        ),
      ),
    );
  }
}

class _LargeAppBarRow extends StatelessWidget {
  const _LargeAppBarRow({
    Key? key,
    required this.screenSize,
    required this.dividerColor,
    required this.colorText,
    required this.shadow,
    required this.items,
  }) : super(key: key);

  final Size screenSize;
  final Color dividerColor;
  final Color colorText;
  final List<Shadow>? shadow;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  InkWell(
                      hoverColor: Colors.grey.withOpacity(0),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Image.asset(
                        'assets/logo.png',
                        width: 200,
                        height: 200/3.5,
                        // width: sizeParam(screenSize.width, 0.1, 100),
                        // height: sizeParam(screenSize.width, 0.03, 50),
                        color: Colors.amberAccent,
                      )),
                  const SizedBox(height: 10,),
                  Text(
                    'Крымская строительная компания',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: colorText, fontSize: 15, shadows: shadow),
                  ),
                ],
              ),
            ),
          ],
        ),

        ...items.map((e) =>
           MenuItem(
              items: e,
              colorText: colorText,
              shadow: shadow,
            )),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  colorText: colorText,
                  text: StringRes.phone,
                  sizeParam: 15,
                  what: 'tel:${StringRes.phone}',
                  shadow: shadow,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
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
                  colorText: colorText,
                  text: StringRes.phoneSecond,
                  sizeParam: 15,
                  what: 'tel:${StringRes.phoneSecond}',
                  shadow: shadow,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.mail_rounded,
            //       size: sizeParam(screenSize.width, 0.01, 20),
            //       color: Colors.amberAccent,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     MyRichText(
            //       colorText: colorText,
            //       text: StringRes.mail,
            //       shadow: shadow,
            //       sizeParam: 15,
            //       what: 'mailto:${StringRes.mail}',
            //     )
            //   ],
            // )
            const SizedBox(height: 10,)
          ],
        ),
      ],
    );
  }
}


class _SmallAppBarRow extends StatelessWidget {
  const _SmallAppBarRow({
    Key? key,
    required this.screenSize,
    required this.dividerColor,
    required this.colorText,
    required this.shadow,
    required this.items,
  }) : super(key: key);

  final Size screenSize;
  final Color dividerColor;
  final Color colorText;
  final List<Shadow>? shadow;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IntrinsicHeight(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                    hoverColor: Colors.grey.withOpacity(0),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      width: 200,
                      height: 200/3.5,
                      color: Colors.amberAccent,
                    )),
              ),
              Flexible(
                child: Text(
                  'Крымская строительная компания',
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorText, fontSize:SizeWidget.isSmallScreen(context)?12:15, shadows: shadow),
                ),
              ),
            ],
          ),
        ),


        Column(
          children: [
            Text(
              'Мы в социальных сетях:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorText, shadows: shadow, fontSize: SizeWidget.isSmallScreen(context)?12:15),
            ),
            const SocialWidget(),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  colorText: colorText,
                  text: StringRes.phone,
                  sizeParam: SizeWidget.isSmallScreen(context)?12:15,
                  what: 'tel:${StringRes.phone}',
                  shadow: shadow,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
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
                  colorText: colorText,
                  text: StringRes.phoneSecond,
                  sizeParam: SizeWidget.isSmallScreen(context)?12:15,
                  what: 'tel:${StringRes.phoneSecond}',
                  shadow: shadow,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.mail_rounded,
            //       size: sizeParam(screenSize.width, 0.01, 20),
            //       color: Colors.amberAccent,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     MyRichText(
            //       colorText: colorText,
            //       text: StringRes.mail,
            //       shadow: shadow,
            //       sizeParam: 15,
            //       what: 'mailto:${StringRes.mail}',
            //     )
            //   ],
            // )
          ],
        ),
      ],
    );
  }
}