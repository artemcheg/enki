import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/pages/main_screen/positionItem.dart';

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({Key? key}) : super(key: key);

  @override
  _InteractiveWidgetState createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  List<String> assets = [
    'assets/interactive/1.jpg',
    'assets/interactive/2.jpg',
    'assets/interactive/3.jpg',
    'assets/interactive/4.jpg'
  ];

  List<Item> itemsFirst = [
    const Item(
        top: 280, left: 300, text: 'Фасадные работы любой сложности', index: 0),
    const Item(
        top: 470, left: 600, text: 'Фасадные работы любой сложности', index: 0),
    const Item(
        top: 350,
        right: 160,
        text: 'Фасадные работы любой сложности',
        index: 0),
    const Item(
        top: 310,
        right: 850,
        text: 'Панарамное остекление любой сложности',
        index: 1),
    const Item(
        bottom: 350,
        right: 850,
        text: 'Панарамное остекление любой сложности',
        index: 1),
    const Item(
        bottom: 60, left: 730, text: 'Строительство бассейнов', index: 2),
    const Item(
        bottom: 350,
        left: 140,
        text: 'Благоустройство и ландшафтные работы',
        index: 3),
    const Item(
        bottom: 240,
        left: 730,
        text: 'Благоустройство и ландшафтные работы',
        index: 3),
    const Item(
        bottom: 350,
        right: 65,
        text: 'Благоустройство и ландшафтные работы',
        index: 3),
  ];

  List<Item> itemsSecond = [
    const Item(top: 470, left: 10, text: 'Декоративная штукатурка', index: 0),
    const Item(
        top: 420,
        left: 300,
        text: 'Стеклянные перегородки по индивидуальному заказу',
        index: 1),
    const Item(
        top: 400,
        left: 700,
        text: 'Собственный цех по изготовлению мебели',
        index: 2),
    const Item(bottom: 50, left: 400, text: 'Натуральный паркет', index: 3),
    const Item(top: 120, left: 800, text: 'Многоуровневые потолки', index: 4),
  ];

  List<Item> itemsThird = [
    const Item(top: 470, left: 350, text: 'Пошив штор', index: 0),
    const Item(
        top: 700,
        left: 550,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 1),
    const Item(
        bottom: 250,
        right: 350,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 1),
    const Item(
        top: 150,
        left: 550,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 1),
    const Item(
        bottom: 300,
        right: 900,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 1),
    const Item(
        top: 300,
        right: 600,
        text: 'Облицовка стен керамогранитом под натуральный камень',
        index: 2),
    const Item(
        bottom: 100,
        left: 600,
        text: 'Облицовка пола мрамором, натуральным камнем',
        index: 3),
  ];

  List<Item> itemsFourth = [
    const Item(top: 50, left: 515, text: 'Монтаж оконных блоков', index: 0),
    const Item(top: 600, left: 515, text: 'Закладка стен', index: 1),
    const Item(
        top: 245,
        right: 500,
        text: 'Железобетонные конструкции любой сложности',
        index: 2),
  ];
  final PageController _controller = PageController();
  double i = 0;

  @override
  void initState() {
    if (_controller.hasClients) {
      i = _controller.page!;
    } else {
      i = 0;
    }
    super.initState();
  }

  bool previous = false;
  bool next = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Наши преимущества:',
          style: TextStyle(
              fontSize: SizeWidget.isSmallScreen(context) ? 20 : 35,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            SizedBox(
              height: SizeWidget.isLargeScreen(context)
                  ? width * 0.4
                  : width * 0.58,
              width: width,
              child: PageView(
                  scrollBehavior:
                      MyCustomScrollBehavior().copyWith(scrollbars: false),
                  controller: _controller,
                  clipBehavior: Clip.none,
                  children: [
                    InteractiveItem(
                      assets: assets[0],
                      listPos: itemsFirst,
                    ),
                    InteractiveItem(
                      assets: assets[1],
                      listPos: itemsSecond,
                    ),
                    InteractiveItem(
                      assets: assets[2],
                      listPos: itemsThird,
                    ),
                    InteractiveItem(
                      assets: assets[3],
                      listPos: itemsFourth,
                    ),
                  ]),
            ),
            SizeWidget.isLargeScreen(context)
                ? Positioned(
                    top: width * 0.35 / 2,
                    left: width * 0.05,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);

                      },
                      onHover: (value) {
                        setState(() {
                          previous = value;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: previous
                                  ? const Color(0XFF52B060)
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 8, top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 70,
                            color: previous
                                ? const Color(0XFF52B060)
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            SizeWidget.isLargeScreen(context)
                ? Positioned(
                    top: width * 0.35 / 2,
                    right: width * 0.05,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      onHover: (value) {
                        setState(() {
                          next = value;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  next ? const Color(0XFF52B060) : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 70,
                            color:
                                next ? const Color(0XFF52B060) : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            highlightColor:Colors.transparent,
            hoverColor:Colors.transparent ,
            splashColor: Colors.transparent,
            onTap: (){},
            child: SmoothPageIndicator(
              effect: const WormEffect(activeDotColor: Color(0XFF52B060)),
              controller: _controller,
              count: 4,
              onDotClicked: (page) {
                _controller.animateToPage(page,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
            ),
          ),
        )
      ],
    );
  }
}

class InteractiveItem extends StatefulWidget {
  final List<Item> listPos;
  final String assets;

  const InteractiveItem({Key? key, required this.assets, required this.listPos})
      : super(key: key);

  @override
  _InteractiveItemState createState() => _InteractiveItemState();
}

class _InteractiveItemState extends State<InteractiveItem> {
  final List<bool> isHovering = [true, false, false, false, false];
  late String text;

  @override
  void initState() {
    text = widget.listPos[0].text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  widget.assets,
                  fit: BoxFit.contain,
                ))),
        ...widget.listPos
            .map(
              (e) => Positioned(
                top: e.top,
                left: e.left,
                right: e.right,
                bottom: e.bottom,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      changeHover(isHovering, e.index);
                      text = e.text;
                    });
                  },
                  onHover: (value) {
                    setState(() {
                      changeHover(isHovering, e.index);
                      text = e.text;
                    });
                  },
                  child: PositionedIcon(
                    isHovering: isHovering[e.index],
                    text: e.text,
                  ),
                ),
              ),
            )
            .toList(),
        Positioned(
          right: 10,
          top: 10,
          child: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>(text),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: SizeWidget.isSmallScreen(context) ? 70 : 50),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class Item {
  final int index;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final String text;

  const Item({
    required this.index,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.text,
  });
}

void changeHover(List<bool> isHovering, int index) {
  isHovering[index] = true;
  for (int i = 0; i < isHovering.length; i++) {
    if (i != index) {
      isHovering[i] = false;
    }
  }
}

class MyCustomScrollBehavior extends ScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.stylus,
      };
}
