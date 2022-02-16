import 'package:flutter/material.dart';

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
      width: 700,
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
                    onTap: () {},
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
                    onTap: () {},
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
                ],
              ),
            ),
          )),
    );
  }
}
