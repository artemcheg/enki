import 'package:flutter/material.dart';
import 'package:web_site/animation/scaleTransition.dart';
import 'package:web_site/animation/transit_anim.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class MyServiceContainer extends StatefulWidget {
  final String assets;
  final String centerText;
  final String route;

  const MyServiceContainer({
    Key? key,
    required this.assets,
    required this.centerText,
    required this.route,
  }) : super(key: key);

  @override
  _MyServiceContainerState createState() => _MyServiceContainerState();
}

class _MyServiceContainerState extends State<MyServiceContainer> {
  bool selected = false;
  bool isHovering = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // boxShadow: shadowBox,
      ),
      child: RepaintBoundary(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: InkWell(
            hoverColor: const Color.fromRGBO(0, 0, 0, 0),
            onTap: () {
              Navigator.pushNamed(context, widget.route);
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
                          BoxDecoration(color: const Color(0x1F000000).withOpacity(0.4)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AnimatedAlign(
                    alignment:
                        isHovering ? Alignment.center : Alignment.bottomLeft,
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      widget.centerText,
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.bold,
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
                            Navigator.pushNamed(context, widget.route);
                          },
                          onHover: (value) {
                            setState(() {
                              selected = value;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'ПОДРОБНЕЕ',
                                style: TextStyle(
                                    color: selected
                                        ? const Color(0XFF52B060)
                                        : const Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: SizeWidget.isSmallScreen(context)
                                        ? 8
                                        : SizeWidget.isMediumScreen(context)
                                            ? 10
                                            : 15),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: selected
                                    ? const Color(0XFF52B060)
                                    : const Color.fromRGBO(255, 255, 255, 1),
                              )
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          color: const Color.fromRGBO(255, 0, 0, 1),
                          duration: const Duration(
                            milliseconds: 100,
                          ),
                          child: const SizedBox(
                            height: 2,
                            width: 130,
                          ),
                          width: selected
                              ? 20
                              : SizeWidget.isSmallScreen(context)
                                  ? 78
                                  : SizeWidget.isMediumScreen(context)
                                      ? 92
                                      : 128,
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
