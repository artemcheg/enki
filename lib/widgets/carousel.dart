import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  ];

  List<Widget> imageItem(screenSize, controller) {
    return images
        .asMap()
        .entries
        .map((entry) => Container(
            alignment: Alignment.center,
            width: screenSize.width,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _controller.animateToPage(entry.key);
                });
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.black.withOpacity(0)),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        entry.value,
                        fit: BoxFit.cover,
                      )),
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
          height: screenSize.width*0.35,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.5),
    );
  }
}
