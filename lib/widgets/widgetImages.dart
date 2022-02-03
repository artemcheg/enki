import 'package:flutter/material.dart';

class MainImage extends StatefulWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;


  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
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
    return ScaleTransition(
      scale: _animation,
      child: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Image.asset(
          'assets/main_image.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
