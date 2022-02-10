import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final bool isHovering;
  final String text;
  final Color colorText;
 final List<Shadow>? shadow;
  const MenuItem({
    Key? key,
    required this.isHovering,
    required this.text, this.colorText = Colors.white, this.shadow,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var styleOn = TextStyle(
        color: const Color(0XFF52B060),
        fontSize: screenSize.width * 0.014,
        shadows: widget.shadow);
    var styleOff = TextStyle(
        color: widget.colorText,
        fontSize: screenSize.width * 0.014,
        shadows: widget.shadow);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.text, style: widget.isHovering ? styleOn : styleOff),
        const SizedBox(
          height: 5,
        ),
        // selected(widget.isHovering)
      ],
    );
  }
}

