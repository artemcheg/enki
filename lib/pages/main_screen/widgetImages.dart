import 'package:flutter/material.dart';
import 'package:web_site/animation/scaleTransition.dart';

class MainImage extends StatefulWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage> {
  ImageProvider backImage = const AssetImage('assets/mainImage.png');
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        _ImageOnMain(screenSize: screenSize, backImage: backImage),
        _LogoOnImage(screenSize: screenSize),
       // _TextOnImage(screenSize: screenSize)
      ],
    );
  }
}

class _ImageOnMain extends StatelessWidget {
  const _ImageOnMain({
    Key? key,
    required this.screenSize,
    required this.backImage,
  }) : super(key: key);

  final Size screenSize;
  final ImageProvider<Object> backImage;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false,
      scaleEnabled: false,
      child: RepaintBoundary(
        child: ScaleAnimation(
          duration: const Duration(seconds: 3),
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: backImage,
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}

class _LogoOnImage extends StatelessWidget {
  const _LogoOnImage({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenSize.width,
        height: screenSize.height / 3,
        margin: EdgeInsets.only(left: 1, top: screenSize.height * 0.3),
        child: Image.asset(
          'assets/logo1.png',
        ));
  }
}

