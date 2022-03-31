import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();

  final List<String> images = [
    'assets/about/office_1.jpg',
    'assets/about/office_2.jpg',
    'assets/about/office_3.jpg',
  ];
  int initialIndexDrag = 0;

  late double initDx;

  List<Widget> imageItem(screenSize, controller) {
    return images
        .asMap()
        .entries
        .map((entry) => Container(
            alignment: Alignment.center,
            width: screenSize.width,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onHorizontalDragStart: (value) {
                  initDx = value.globalPosition.dx;
                },
                onHorizontalDragUpdate: (value) {
                    _controller.animateToPage(
                        swipeImage(initDx, value.globalPosition.dx, entry.key));
                },
                onTap: (){
                  _controller.animateToPage(entry.key);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                             BorderRadius.all(Radius.circular(SizeWidget.isSmallScreen(context)?10:20))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeWidget.isSmallScreen(context)?10:20),
                        child: Image.asset(
                          entry.value,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ),
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return CarouselSlider(
      carouselController: _controller,
      items: imageItem(screenSize, _controller),
      options: CarouselOptions(
          height:
              SizeWidget.isSmallScreen(context) ? 300 : screenSize.width * 0.35,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction:SizeWidget.isSmallScreen(context)?0.6:0.3),
    );
  }
}

int swipeImage(double initDx, double newDx, int index) {
  if (newDx < initDx) {
    index++;
  } else if (newDx > initDx) {
    index--;
  }
  return index;
}
