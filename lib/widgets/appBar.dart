import 'package:flutter/material.dart';

import 'SizeWidget.dart';

class PrefSizeAppBar extends StatefulWidget {
  final double opacity;

  const PrefSizeAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  _PrefSizeAppBarState createState() => _PrefSizeAppBarState();
}

class _PrefSizeAppBarState extends State<PrefSizeAppBar> {
  final List _isHovering = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var styleOn = TextStyle(
        color: const Color(0XFF52B060), fontSize: screenSize.width * 0.012);
    var styleOff =
        TextStyle(color: Colors.white, fontSize: screenSize.width * 0.012);

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
                    SizedBox(width: screenSize.width * 0.01),
                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      indent: 10,
                      endIndent: 7,
                      color: Colors.white54,
                    ),
                    SizedBox(width: screenSize.width * 0.01),
                    Text(
                      'Крымская\nстроительная\nкомпания',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: sizeParam(screenSize.width, 0.008, 10)),
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
                        size: sizeParam(screenSize.width, 0.02, 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SelectableText(
                          '+7 (978) 723 12 40',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sizeParam(screenSize.width, 0.01, 10)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail_rounded,
                        size: sizeParam(screenSize.width, 0.02, 20),
                        color: Colors.amberAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Text(
                            'info@enki-crimea.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: sizeParam(screenSize.width, 0.01, 10),
                            ),
                          ))
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        'Нужна консультация?',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: sizeParam(screenSize.width, 0.01, 10)),
                      ),
                      Text('Мы перезвоним!',
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: sizeParam(screenSize.width, 0.01, 10))),
                      Text('Заказать обратный звонок',
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: sizeParam(screenSize.width, 0.01, 10)))
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
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[0] = value;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('ГЛАВНАЯ',
                              style: _isHovering[0] ? styleOn : styleOff),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: screenSize.width / 20,
                    // ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[1] = value;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'УСЛУГИ',
                            style: _isHovering[1] ? styleOn : styleOff,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: screenSize.width / 20,
                    // ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[2] = value;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'НАШИ ПРОЕКТЫ',
                            style: _isHovering[2] ? styleOn : styleOff,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(width: screenSize.width/20,),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          _isHovering[3] = value;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'КОНТАКТЫ',
                            style: _isHovering[3] ? styleOn : styleOff,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
          SizeWidget.isSmallScreen(context)
              ? Row(
                  children: [
                    const Text(
                      'МЕНЮ',
                      style: TextStyle(color: Colors.white),
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

smallAppBar(opacity) => AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueGrey.shade900.withOpacity(opacity),
      elevation: 0,
      title: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Image(
              width: 200,
              height: 100,
              image: AssetImage('assets/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.mail_rounded,
                color: Colors.amberAccent,
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'info@enki-crimea.com',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
    );

sizeParam(double screenWidth, double index, int normSize) {
  if (screenWidth * index < normSize) {
    return normSize;
  } else {
    return screenWidth * index;
  }
}
