import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_site/pages/full_image.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();

  final List<String> images = [
    'assets/carousel/office.jpg',
    'assets/carousel/1.jpg',
    'assets/carousel/2.jpg',
    'assets/carousel/3.jpg',
    'assets/house.jpg'
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
                  setState(() {
                    _controller.animateToPage(
                        swipeImage(initDx, value.globalPosition.dx, entry.key));
                  });
                },
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return FullImage(imagePath: entry.value);
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: 'fullImage',
                          child: Image.asset(
                            entry.value,
                            fit: BoxFit.cover,
                          ),
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
              SizeWidget.isSmallScreen(context) ? 200 : screenSize.width * 0.35,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.5),
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
