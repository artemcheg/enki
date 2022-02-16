import 'package:flutter/material.dart';
import 'package:web_site/animation/scaleTransition.dart';
import 'package:web_site/animation/transit_anim.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class MyServiceContainer extends StatefulWidget {
  final String assets;
  final String centerText;

  const MyServiceContainer({
    Key? key,
    required this.assets,
    required this.centerText,
  }) : super(key: key);

  @override
  _MyServiceContainerState createState() => _MyServiceContainerState();
}

class _MyServiceContainerState extends State<MyServiceContainer> {
 bool selected=false;
 bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)),boxShadow:[

        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: () {},
          onHover: (value) {
            setState(() {
              isHovering = value;
            });
          },
          child: Stack(
            children: [
              InteractiveViewer(
                child: ScaledContainer(
                  start: isHovering,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.assets), fit: BoxFit.cover)),
                  ),
                ),
              ),
              TransitionAnimationContainer(
                forward: isHovering,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(0.4)),
                  child: Stack(
                    children: [
                      Center(
                          child: Text(
                        widget.centerText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeParam(screenSize.width, 0.02, 12)),
                      )),
                      Positioned(
                          top: 20,
                          left: 20,
                          child: InkWell(
                            hoverColor: Colors.transparent,
                            onTap: (){},
                              onHover: (value){
                              setState(() {
                                selected=value;
                              });
                              },
                              child: Text(
                            'ПОДРОБНЕЕ',
                            style: TextStyle(
                                color:selected?const Color(0XFF52B060):Colors.white,
                                fontSize: sizeParam(screenSize.width, 0.008, 8)),
                          )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
