import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/pages/main_screen/positionItem.dart';
import 'package:web_site/widgets/small_changes.dart';

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
        top: 400,
        left: 300,
        text: 'Фасадные работы любой сложности',
        index: 0,
        alignment: Alignment.topLeft),
    const Item(
        top: 420,
        left: 750,
        text: 'Фасадные работы любой сложности',
        index: 1,
        alignment: Alignment.centerLeft),
    const Item(
        top: 350,
        right: 160,
        text: 'Фасадные работы любой сложности',
        index: 2,
        alignment: Alignment.centerLeft),
    const Item(
        top: 270,
        right: 850,
        text: 'Панарамное остекление любой сложности',
        index: 3,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 420,
        right: 850,
        text: 'Панарамное остекление любой сложности',
        index: 4,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 60,
        left: 730,
        text: 'Строительство бассейнов',
        index: 5,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 350,
        left: 140,
        text: 'Благоустройство и ландшафтные работы',
        index: 6,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 240,
        left: 730,
        text: 'Благоустройство и ландшафтные работы',
        index: 7,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 350,
        right: 65,
        text: 'Благоустройство и ландшафтные работы',
        index: 8,
        alignment: Alignment.centerLeft),
  ];

  List<Item> itemsSecond = [
    const Item(
        top: 500,
        left: 10,
        text: 'Декоративная штукатурка',
        index: 0,
        alignment: Alignment.centerLeft),
    const Item(
        top: 420,
        left: 300,
        text: 'Стеклянные перегородки по индивидуальному заказу',
        index: 1,
        alignment: Alignment.centerLeft),
    const Item(
        top: 400,
        left: 870,
        text: 'Собственный цех по изготовлению мебели',
        index: 2,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 50,
        left: 400,
        text: 'Натуральный паркет',
        index: 3,
        alignment: Alignment.centerLeft),
    const Item(
        top: 120,
        left: 800,
        text: 'Многоуровневые потолки',
        index: 4,
        alignment: Alignment.centerLeft),
  ];

  List<Item> itemsThird = [
    const Item(
        top: 470,
        left: 350,
        text: 'Пошив штор',
        index: 0,
        alignment: Alignment.centerLeft),
    const Item(
        top: 700,
        left: 550,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 1,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 250,
        right: 350,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 2,
        alignment: Alignment.centerLeft),
    const Item(
        top: 150,
        left: 550,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 3,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 400,
        right: 800,
        text: 'Собственное производство дизайнерской мебели и декора из дерева',
        index: 4,
        alignment: Alignment.centerLeft),
    const Item(
        top: 300,
        right: 600,
        text: 'Облицовка стен керамогранитом под натуральный камень',
        index: 5,
        alignment: Alignment.centerLeft),
    const Item(
        bottom: 100,
        left: 600,
        text: 'Облицовка пола мрамором, натуральным камнем',
        index: 6,
        alignment: Alignment.centerLeft),
  ];

  List<Item> itemsFourth = [
    const Item(
        top: 50,
        left: 515,
        text: 'Монтаж оконных блоков',
        index: 0,
        alignment: Alignment.centerLeft),
    const Item(
        top: 600,
        left: 515,
        text: 'Закладка стен',
        index: 1,
        alignment: Alignment.centerLeft),
    const Item(
        top: 245,
        right: 500,
        text: 'Железобетонные конструкции любой сложности',
        index: 2,
        alignment: Alignment.centerLeft),
  ];
  final PageController _controller = PageController();

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
          'Наши возможности:',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: sizeParam(width, 0.015, 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            SizedBox(
              height: SizeWidget.isLargeScreen(context)
                  ? width * 0.45
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
                    top: width * 0.45 / 2,
                    left: width * 0.03,
                    child: InkWell(
                      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                      highlightColor: const Color.fromRGBO(0, 0, 0, 0),
                      splashColor: const Color.fromRGBO(0, 0, 0, 0),
                      onTap: () {
                        if (_controller.page! > 0) {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else {
                          _controller.animateToPage(3,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
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
                                  : const Color.fromRGBO(0, 0, 0, 1),
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 70,
                            color: previous
                                ? const Color(0XFF52B060)
                                : const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            SizeWidget.isLargeScreen(context)
                ? Positioned(
                    top: width * 0.45 / 2,
                    right: width * 0.03,
                    child: InkWell(
                      hoverColor: const Color.fromRGBO(0, 0, 0, 0),
                      highlightColor: const Color.fromRGBO(0, 0, 0, 0),
                      splashColor: const Color.fromRGBO(0, 0, 0, 0),
                      onTap: () {
                        if(_controller.page!<3){
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);}
                        else{
                          _controller.animateToPage(0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
                      },
                      onHover: (value) {
                        setState(() {
                          next = value;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: next
                                  ? const Color(0XFF52B060)
                                  : const Color.fromRGBO(0, 0, 0, 1),
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 70,
                            color: next
                                ? const Color(0XFF52B060)
                                : const Color.fromRGBO(0, 0, 0, 1),
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
            highlightColor: const Color.fromRGBO(0, 0, 0, 0),
            hoverColor: const Color.fromRGBO(0, 0, 0, 0),
            splashColor: const Color.fromRGBO(0, 0, 0, 0),
            onTap: () {},
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
  final List<bool> isHovering = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  late String text;

  @override
  void initState() {
    text = widget.listPos[0].text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: shadowBox,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    widget.assets,
                    fit: BoxFit.contain,
                  ))),
          ...widget.listPos.map(
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
                ),
              ),
            ),
          ),
          ...widget.listPos.map(
            (e) => Positioned(
              right: correctPos(e.right),
              top: correctPos(e.top),
              bottom: correctPos(e.bottom),
              left: correctPos(e.left),
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                duration: const Duration(milliseconds: 500),
                child: isHovering[e.index]
                    ? Container(
                        width: SizeWidget.isSmallScreen(context) ? 500 : 430,
                        key: ValueKey<String>(text),
                        decoration: const BoxDecoration(
                            color: Color(0XFF52B060),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            textScaleFactor: 0.8,
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontSize: SizeWidget.isSmallScreen(context)
                                    ? 70
                                    : 50),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
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
  final Alignment alignment;

  const Item({
    required this.alignment,
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

double? correctPos(double? incorrectPosition) {
  if (incorrectPosition != null) {
    return incorrectPosition + 30;
  } else {
    return null;
  }
}
