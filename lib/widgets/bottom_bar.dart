import 'package:flutter/material.dart';

import '../resources/string_res.dart';
import 'SizeWidget.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  textStyle(screenWidth) => TextStyle(
      color: Colors.white, fontSize: sizeParam(screenWidth, 0.007, 8));

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/logo.png',
                        color: Colors.amberAccent,
                        width: sizeParam(screenSize.width, 0.1, 100),
                        height: sizeParam(screenSize.width, 0.03, 50),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      StringRes.bottomAbout,
                      textAlign: TextAlign.center,
                      style: textStyle(screenSize.width),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Контакты:',
                      style: textStyle(screenSize.width),
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
