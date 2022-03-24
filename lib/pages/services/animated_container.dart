import 'package:flutter/material.dart';
import 'package:web_site/animation/scaleTransition.dart';
import 'package:web_site/animation/transit_anim.dart';
import 'package:web_site/widgets/SizeWidget.dart';
import 'package:web_site/widgets/small_changes.dart';



class MyServiceContainer extends StatefulWidget {
  final String assets;
  final String centerText;
  final String route;

  const MyServiceContainer({
    Key? key,
    required this.assets,
    required this.centerText, required this.route,
  }) : super(key: key);

  @override
  _MyServiceContainerState createState() => _MyServiceContainerState();
}

class _MyServiceContainerState extends State<MyServiceContainer> {
  bool selected = false;
  bool isHovering = false;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
                Navigator.pushNamed(
                  context,widget.route
                );
             },
            onHover: (value) {
              setState(() {
                isHovering = value;
              });
            },
            child: Stack(
              children: [
                RepaintBoundary(
                  child: ScaledContainer(
                    start: isHovering,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.assets),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                RepaintBoundary(
                  child: TransitionAnimationContainer(
                    forward: isHovering,
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black12.withOpacity(0.4)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AnimatedAlign(
                    alignment: isHovering?Alignment.center:Alignment.bottomLeft,
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      widget.centerText,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: shadowList,
                          fontSize: sizeParam(screenSize.width, 0.015, 15)),
                    ),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context,widget.route
                        );
                      },
                      onHover: (value){setState(() {
                        selected=value;
                      });},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ПОДРОБНЕЕ',
                            style: TextStyle(
                                color: selected
                                    ? const Color(0XFF52B060)
                                    : Colors.white,
                                fontSize:
                                SizeWidget.isSmallScreen(context)?8:SizeWidget.isMediumScreen(context)?10:15),
                          ),
                          Icon(Icons.arrow_forward,color:  selected
                              ? const Color(0XFF52B060)
                              : Colors.white,)
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      color: Colors.red,
                      duration: const Duration(
                        milliseconds: 100,
                      ),
                      child: const SizedBox(
                        height: 2,
                        width: 130,
                      ),
                      width: selected ? 20 : SizeWidget.isSmallScreen(context)?78:SizeWidget.isMediumScreen(context)?92:128,
                    )
                  ],
                ),
              ),
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
