import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';


class PositionedIcon extends StatelessWidget {
  final bool isHovering;
  final String text;
  const PositionedIcon({Key? key, this.isHovering = false, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AvatarGlow(
          endRadius: 60,
          glowColor: Colors.white,
          duration: const Duration(seconds: 2),
          repeat: true,
          showTwoGlows: true,
          curve: Curves.easeOutQuart,
          child: Icon(
            Icons.add_circle_outlined,
            color: isHovering ? const Color(0XFF52B060) : Colors.white,
            size: 70,
          )),
    );
  }
}



