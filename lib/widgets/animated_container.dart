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
                panEnabled: false,
                scaleEnabled: false,
                child: ScaledContainer(
                  start: isHovering,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.assets),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              TransitionAnimationContainer(
                forward: isHovering,
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black12.withOpacity(0.4)),
                  child: Stack(
                    children: [
                      Center(
                          child: Text(
                        widget.centerText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeParam(screenSize.width, 0.02, 12)),
                      )),
                      // Positioned(
                      //   top: 20,
                      //   left: 20,
                      //   child: InkWell(
                      //     hoverColor: Colors.transparent,
                      //     onTap: () {},
                      //     onHover: (value) {
                      //       setState(() {
                      //         selected = value;
                      //       });
                      //     },
                      //     child: Text(
                      //       'ПОДРОБНЕЕ',
                      //       style: TextStyle(
                      //           color: selected
                      //               ? const Color(0XFF52B060)
                      //               : Colors.white,
                      //           fontSize:
                      //               sizeParam(screenSize.width, 0.008, 8)),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20,right: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    onHover: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                          // width: selected ? 20 : 130,
                        )
                      ],
                    ),
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
