import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final MenuItems items;
  final Color colorText;
 final List<Shadow>? shadow;

  const MenuItem({
    Key? key,
    this.colorText = Colors.white, this.shadow, required this.items,
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
        fontWeight: FontWeight.bold,
        color: const Color(0XFF52B060),
        fontSize: screenSize.width * 0.014,
        shadows:selected?null:widget.shadow);
    var styleOff = TextStyle(
        fontWeight: FontWeight.bold,
        color: widget.colorText,
        fontSize: screenSize.width * 0.014,
        shadows: widget.shadow);

    return InkWell(
      hoverColor: Colors.grey.withOpacity(0),
      onTap: () {
        Navigator.pushNamed(context, widget.items.routes);
      },
      onHover: (value) {
        setState(() {
          selected = value;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.items.text, style: selected ? styleOn : styleOff),
          const SizedBox(
            height: 5,
          ),
          // selected(widget.isHovering)
        ],
      ),
    );
  }
}

class MenuItems{
  final String text;
  final String routes;
  const MenuItems(this.text, this.routes);
}