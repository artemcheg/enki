import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class PositionedIcon extends StatefulWidget {
  final bool isHovering;

  const PositionedIcon(
      {Key? key, required this.isHovering})
      : super(key: key);

  @override
  _PositionedIconState createState() => _PositionedIconState();
}

class _PositionedIconState extends State<PositionedIcon> {
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
        endRadius: 40,
        glowColor: Colors.white,
        duration: const Duration(seconds: 3),
        repeat: true,
        showTwoGlows: true,
        curve: Curves.easeOutQuart,
        child: Icon(
          Icons.add_circle,
          color: widget.isHovering ? const Color(0XFF52B060) : Colors.white,
          size: SizeWidget.isSmallScreen(context)?60:40,
        ));
  }
}
