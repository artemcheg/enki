import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:web_site/widgets/SizeWidget.dart';

class PositionedIcon extends StatelessWidget {
  final bool isHovering;

  const PositionedIcon({Key? key, required this.isHovering})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AvatarGlow(
          endRadius: 60,
          glowColor:Colors.white,
          duration: const Duration(seconds: 2),
          repeat: true,
          showTwoGlows: true,
          curve: Curves.easeOutQuart,
          child: Icon(
            Icons.add_circle_outlined,
            color: isHovering ? const Color(0XFF52B060) : Colors.white,
            size: SizeWidget.isSmallScreen(context) ? 100 : 70,
          )),
    );
  }
}
