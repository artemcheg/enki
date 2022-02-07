
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    var styleOn = TextStyle(
        color: const Color(0XFF52B060), fontSize: screenSize.width * 0.014);
    var styleOff =
        TextStyle(color: Colors.white, fontSize: screenSize.width * 0.014);

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
                          fontSize: sizeParam(screenSize.width, 0.008, 13)),
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
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[4] = value;
                          });
                        },
                        onTap: () {},
                        child: SelectableText.rich(
                          TextSpan(
                              text: '+7 (978) 723 12 40',
                              style: TextStyle(
                                  color: _isHovering[4]
                                      ? const Color(0XFF52B060)
                                      : Colors.white,
                                  fontSize:
                                      sizeParam(screenSize.width, 0.008, 13)),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  launch('tel:+79787231240',
                                      webOnlyWindowName: '_self');
                                }),
                          toolbarOptions: const ToolbarOptions(
                              copy: true, selectAll: true),
                          cursorColor: Colors.red,
                          showCursor: true,
                        ),
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
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[5] = value;
                          });
                        },
                        onTap: () {},
                        child: SelectableText.rich(
                          TextSpan(
                              text: 'info@enki-crimea.com',
                              style: TextStyle(
                                  color: _isHovering[5]
                                      ? const Color(0XFF52B060)
                                      : Colors.white,
                                  fontSize:
                                      sizeParam(screenSize.width, 0.008, 13)),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  launch(
                                    'mailto:info@enki-crimea.com',
                                  );
                                }),
                          toolbarOptions: const ToolbarOptions(
                              copy: true, selectAll: true),
                          cursorColor: Colors.red,
                          showCursor: true,
                        ),
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
                      Text(
                        'Нужна консультация?',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: sizeParam(screenSize.width, 0.008, 13)),
                      ),
                      Text('Мы перезвоним!',
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize:
                                  sizeParam(screenSize.width, 0.008, 13))),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[6] = value;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          children: [
                            Text('Заказать обратный звонок',
                                style: TextStyle(
                                    color: const Color(0XFF52B060),
                                    fontSize: sizeParam(
                                        screenSize.width, 0.008, 13))),
                            AnimatedContainer(
                              color: Colors.red,
                              duration: const Duration(
                                milliseconds: 100,
                              ),
                              child: SizedBox(
                                height: 2,
                                width: screenSize.width * 0.1,
                              ),
                              width: _isHovering[6]
                                  ? screenSize.width * 0.03
                                  : screenSize.width * 0.1,
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
                          selected(_isHovering[0])
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
                          selected(_isHovering[1])
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
                          selected(_isHovering[2])
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
                          selected(_isHovering[3])
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
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
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
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[0] = value;
                  });
                },
                onTap: () {},
                child: SelectableText.rich(
                  TextSpan(
                      text: "+7 (978) 723 12 40",
                      style: TextStyle(
                        color: _isHovering[0]
                            ? const Color(0XFF52B060)
                            : Colors.white,
                      ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          launch('tel:+79787231240',
                              webOnlyWindowName: '_self');
                        }),
                  toolbarOptions:
                      const ToolbarOptions(copy: true, selectAll: true),
                  cursorColor: Colors.red,
                  showCursor: true,
                ),
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
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[1] = value;
                  });
                },
                onTap: () {},
                child: SelectableText.rich(
                  TextSpan(
                      text: "info@enki-crimea.com",
                      style: TextStyle(
                        color: _isHovering[1]
                            ? const Color(0XFF52B060)
                            : Colors.white,
                      ),
                      mouseCursor: SystemMouseCursors.click,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                            'mailto:info@enki-crimea.com',
                          );
                        }),
                  toolbarOptions:
                      const ToolbarOptions(copy: true, selectAll: true),
                  cursorColor: Colors.red,
                  showCursor: true,
                ),
              ),
              const SizedBox(
                width: 50,
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
                      color: Colors.white,
                    ),
                  ),
                  const Text('Мы перезвоним!',
                      style: TextStyle(
                        color: Colors.white,
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
                              color: Color(0XFF52B060),
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
                          width: _isHovering[2]
                              ? screenSize.width * 0.1
                              : screenSize.width * 0.25,
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
    );
  }
}

selected(bool show) => Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSize: true,
      visible: show,
      child: Container(
        height: 2,
        width: 20,
        color: Colors.white,
      ),
    );

richTextSelectable(String text, bool isHovering, double screenSize) =>
    SelectableText.rich(
      TextSpan(
          text: text,
          style: TextStyle(
              color: isHovering ? const Color(0XFF52B060) : Colors.white,
              fontSize: sizeParam(screenSize, 0.008, 10)),
          mouseCursor: SystemMouseCursors.click,
          recognizer: TapGestureRecognizer()..onTap = () {}),
      toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
      cursorColor: Colors.red,
      showCursor: true,
    );
