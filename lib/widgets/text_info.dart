import 'package:flutter/material.dart';

import 'SizeWidget.dart';

class TextInfoWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final Border border;

  const TextInfoWidget(
      {Key? key,
      required this.text1,
      required this.text2,
      this.border = const Border()})
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
    );
  }
}
