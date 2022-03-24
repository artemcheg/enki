import 'package:flutter/material.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/rich_text.dart';
import 'package:web_site/widgets/social_widget.dart';
import '../resources/string_res.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var styleOn = const TextStyle(color: Color(0XFF52B060), fontSize: 15);
  var styleOff = const TextStyle(color: Colors.white, fontSize: 15);
  final List _isHovering = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeWidget.isMediumScreen(context)?400:800,
      child: Drawer(
          backgroundColor: Colors.blueGrey.shade900,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 50, right: 20),
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      )),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[0] = value;
                      });
                    },
                    onTap: () {Navigator.pushNamed(context, '/');},
                    child: Text(
                      'ГЛАВНАЯ',
                      style: _isHovering[0] ? styleOn : styleOff,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[1] = value;
                      });
                    },
                    onTap: () {},
                    child: Text(
                      'НАШИ ПРОЕКТЫ',
                      style: _isHovering[1] ? styleOn : styleOff,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[3] = value;
                      });
                    },
                    onTap: () {
                      Navigator.pushNamed(context, '/services');
                    },
                    child: Text(
                      'УСЛУГИ',
                      style: _isHovering[3] ? styleOn : styleOff,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[4] = value;
                      });
                    },
                    onTap: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    child: Text(
                      'О НАС',
                      style: _isHovering[4] ? styleOn : styleOff,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        _isHovering[5] = value;
                      });
                    },
                    onTap: () {Navigator.pushNamed(
                      context,
                      '/contacts',
                    );},
                    child: Text(
                      'КОНТАКТЫ',
                      style: _isHovering[5] ? styleOn : styleOff,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.amberAccent,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyRichText(
                        weight: null,
                        colorText: Colors.white,
                        text: StringRes.phone,
                        sizeParam: 15,
                        what: 'tel:${StringRes.phone}',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.amberAccent,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyRichText(
                        weight: null,
                        colorText: Colors.white,
                        text: StringRes.phone,
                        sizeParam: 15,
                        what: 'tel:${StringRes.phone}',
                      )
                    ],
                  ),
                    const SizedBox(
                      height: 15,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.mail_rounded,
                        size: 20,
                        color: Colors.amberAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyRichText(
                        weight: null,
                        colorText: Colors.white,
                        text: StringRes.mail,
                        sizeParam: 15,
                        what: 'mailto:${StringRes.mail}',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SocialWidget()
                ],
              ),
            ),
          )),
    );
  }
}
