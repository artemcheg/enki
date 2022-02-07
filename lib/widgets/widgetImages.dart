import 'package:flutter/material.dart';
import '../animation/text_anim.dart';
import 'SizeWidget.dart';
import 'appBar.dart';

class MainImage extends StatefulWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;
  var squareScaleA = 0.5;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.3, end: 1).animate(_controller);

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        InteractiveViewer(
          panEnabled: false,
          scaleEnabled: false,
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/house.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Container(
            width: screenSize.width,
            height: screenSize.height / 3,
            margin: EdgeInsets.only(left: 1, top: screenSize.height * 0.3),
            child: Image.asset(
              'assets/logo1.png',
              color: Colors.black.withOpacity(0.3),
            )),
        SizeWidget.isPhoneScreen(context)
            ? const SmallAppBar(opacity: 0)
            : const PrefSizeAppBar(
                opacity: 0,
              ),
        Padding(
          padding: EdgeInsets.only(
              left: screenSize.width * 0.04, top: screenSize.height * 0.7),
          child: TextAnimation(
              animTime: const Duration(seconds: 2),
              offset: 2,
              curve: Curves.ease,
              child: Text(
                'Проектирование, строительство, ремонт и\nдизайн интерьера.',
                style: TextStyle(
                    fontSize: sizeParam(screenSize.width, 0.025, 30),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        )
      ],
    );
  }
}
