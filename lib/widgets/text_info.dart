import 'package:flutter/material.dart';
import 'package:web_site/animation/scroll_animation.dart';

import 'SizeWidget.dart';

class TextInfoWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final Border border;
  final ScrollController scrollController;
  final GlobalKey parentKey;
  final Duration durationStart;

  const TextInfoWidget(
      {Key? key,
      required this.text1,
      required this.text2,
      this.border = const Border(),
      required this.scrollController,
      required this.parentKey,
      this.durationStart = const Duration(milliseconds: 0)})
      : super(key: key);

  @override
  _TextInfoWidgetState createState() => _TextInfoWidgetState();
}

class _TextInfoWidgetState extends State<TextInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100.withOpacity(0.1),
          border: widget.border),
      height: SizeWidget.isSmallScreen(context)
          ? screenSize.height * 0.1
          : screenSize.height * 0.25,
      padding: const EdgeInsets.all(1),
      alignment: Alignment.center,
      child: ScrollAnimation(
        durationStart: widget.durationStart,
        animTime: Duration(seconds: 2),
        curve: Curves.decelerate,
        parentKey: widget.parentKey,
        scrollController: widget.scrollController,
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: widget.text1,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeWidget.isSmallScreen(context)
                        ? 20
                        : sizeParam(screenSize.width, 0.03, 20)),
                children: [
                  TextSpan(
                      text: '\n${widget.text2}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeWidget.isSmallScreen(context)
                              ? 15
                              : sizeParam(screenSize.width, 0.02, 15))),
                ])),
      ),
    );
  }
}
