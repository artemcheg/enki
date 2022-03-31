import 'package:flutter/material.dart';
import 'package:web_site/resources/string_res.dart';
import 'package:web_site/widgets/menu_item.dart';
import 'package:web_site/widgets/rich_text.dart';
import 'package:web_site/widgets/small_changes.dart';
import 'SizeWidget.dart';

class SmallAppBar extends StatelessWidget {
  final Color colorDrawer;
  final Color colorText;
  final List<Shadow>? shadow;
  final Color backGround;
  final LinearGradient? gradient;

  const SmallAppBar(
      {Key? key,
      this.colorDrawer = Colors.white,
      this.colorText = Colors.white,
      this.shadow,
      this.backGround = const Color(0xff263238), this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(gradient: gradient,color:backGround),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              hoverColor: const Color.fromRGBO(255, 255, 255, 0),
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.view_headline_sharp),
              color: colorDrawer,
            ),
            Column(
              children: [
                InkWell(
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      width: 190,
                      height: 190 / 3.5,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Качество меняет все!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorText,
                      fontSize: 15,
                      shadows: shadow),
                ),
                const SizedBox(height: 10,)
              ],
            ),
            const SizedBox.shrink()
          ],
        ));
  }
}

class PrefSizeAppBar extends StatelessWidget {
  final Color colorDrawer;
  final Color colorText;
  final List<Shadow>? shadow;
  final Color backGround;
  final LinearGradient? gradient;

  PrefSizeAppBar(
      {Key? key,
      this.colorDrawer = const Color.fromRGBO(255, 255, 255, 1),
      this.colorText = const Color.fromRGBO(255, 255, 255, 1),
      this.shadow = shadowList,
      this.backGround = const Color(0xff263238),
      this.gradient})
      : super(key: key);

  final List items = [
    const MenuItems('ГЛАВНАЯ', '/'),
    const MenuItems('УСЛУГИ', '/services'),
    const MenuItems('ПОРТФОЛИО', '/portfolio'),
    const MenuItems('О НАС', '/about'),
    const MenuItems('КОНТАКТЫ', '/contacts'),
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(gradient: gradient,color:backGround),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeWidget.isLargeScreen(context)
                ? _LargeAppBarRow(
                    screenSize: screenSize,
                    colorText: colorText,
                    shadow: shadow,
                    items: items)
                : _SmallAppBarRow(
                    screenSize: screenSize,
                    colorText: colorText,
                    shadow: shadow,
                    items: items,
                    colorDrawer: colorDrawer,
                  ),
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
    required this.colorText,
    required this.shadow,
    required this.items,
  }) : super(key: key);

  final Size screenSize;
  final Color colorText;
  final List<Shadow>? shadow;
  final List items;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  InkWell(
                      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Image.asset(
                        'assets/logo.png',
                        width: 190,
                        height: 190 / 3.5,
                      ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Качество меняет все!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorText,
                        fontSize: 15,
                        shadows: shadow),
                  ),
                ],
              ),
            ),
            ...items.map((e) => MenuItem(
                  items: e,
                  colorText: colorText,
                  shadow: shadow,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: const Color(0xFFFFD740),
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
                      color: const Color(0xFFFFD740),
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
                Text(
                  "Консультация бесплатно!",
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      shadows: shadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
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
    required this.colorText,
    required this.shadow,
    required this.items,
    required this.colorDrawer,
  }) : super(key: key);

  final Size screenSize;
  final Color colorText;
  final List<Shadow>? shadow;
  final List items;
  final Color colorDrawer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _MenuDrawerItem(colorDrawer: colorDrawer, shadow: shadow),
        IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                    hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      width: 190,
                      height: 190 / 3.5,
                    )),
              ),
              Flexible(
                child: Text(
                  'Качество меняет всё!',
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorText,
                      fontSize: 15,
                      shadows: shadow),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color:  Color(0xFFFFD740),
                  size: 20,
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
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Color(0xFFFFD740),
                  size: 20,
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
            Text(
              "Консультация бесплатно!",
              style: TextStyle(
                fontFamily: 'Comfortaa',
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                shadows: shadow,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ],
    );
  }
}

class _MenuDrawerItem extends StatefulWidget {
  const _MenuDrawerItem({
    Key? key,
    required this.colorDrawer,
    required this.shadow,
  }) : super(key: key);

  final Color colorDrawer;
  final List<Shadow>? shadow;

  @override
  State<_MenuDrawerItem> createState() => _MenuDrawerItemState();
}

class _MenuDrawerItemState extends State<_MenuDrawerItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Scaffold.of(context).openDrawer(),
      onHover: (value) {
        isHovering = value;
        setState(() {});
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'МЕНЮ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:
                      isHovering ? const Color(0XFF52B060) : widget.colorDrawer,
                  shadows: isHovering ? null : widget.shadow),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.view_headline_sharp,
              color: isHovering ? const Color(0XFF52B060) : widget.colorDrawer,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
