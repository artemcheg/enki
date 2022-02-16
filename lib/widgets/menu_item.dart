import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final Color colorText;
 final List<Shadow>? shadow;
 final String route;
  const MenuItem({
    Key? key,
    required this.text, this.colorText = Colors.white, this.shadow, required this.route,
  }) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool selected = false;
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

    return InkWell(
      hoverColor: Colors.grey.withOpacity(0),
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
      onHover: (value) {
        setState(() {
          selected = value;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.text, style: selected ? styleOn : styleOff),
          const SizedBox(
            height: 5,
          ),
          // selected(widget.isHovering)
        ],
      ),
    );
  }
}

