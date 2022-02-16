import 'package:flutter/material.dart';
import 'package:web_site/animation/scaleTransition.dart';
import 'package:web_site/widgets/small_changes.dart';
import '../animation/transit_anim.dart';
import 'SizeWidget.dart';

class MainImage extends StatefulWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage> {
  ImageProvider backImage = const AssetImage('assets/house.jpg');
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        InteractiveViewer(
          panEnabled: false,
          scaleEnabled: false,
          child: ScaleAnimation(
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
        Container(
            width: screenSize.width,
            height: screenSize.height / 3,
            margin: EdgeInsets.only(left: 1, top: screenSize.height * 0.3),
            child: Image.asset(
              'assets/logo1.png',
              color: Colors.black.withOpacity(0.3),
            )),

       SizeWidget.isPhoneScreen(context)&&screenSize.width<350?const SizedBox.shrink():Padding(
          padding: EdgeInsets.only(
              left: screenSize.width * 0.04, top: screenSize.height * 0.7),
          child: TransitionAnimation(
              animTime: const Duration(seconds: 2),
              offset: 2,
              curve: Curves.ease,
              child: Text(
                'Проектирование, строительство, ремонт и\nдизайн интерьера.',
                style: TextStyle(
                    fontSize: screenSize.height < 350
                        ? 15
                        : sizeParam(screenSize.width, 0.025, 30),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,shadows: shadowList),
              )),
        )
      ],
    );
  }
}
