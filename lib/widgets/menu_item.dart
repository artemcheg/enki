import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  bool isHovering;
  final String text;
  MenuItem({Key? key, required this.isHovering, required this.text}) : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var styleOn = TextStyle(
        color: const Color(0XFF52B060), fontSize: screenSize.width * 0.014);
    var styleOff =

    TextStyle(color: Colors.white, fontSize: screenSize.width * 0.014);

    return InkWell(
      onHover: (value) {
        setState(() {
          widget.isHovering = value;
        });
      },
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.text, style: widget.isHovering ? styleOn : styleOff),
          const SizedBox(
            height: 5,
          ),
          selected(widget.isHovering)
        ],
      ),
    );
  }
}

selected(bool show) => Visibility(
  maintainAnimation: true,
  maintainState: true,
  maintainSize: true,
  visible: show,
  child: Container(
    height: 2,
    width: 20,
    color: Colors.white,
  ),
);