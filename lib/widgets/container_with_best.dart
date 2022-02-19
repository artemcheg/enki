import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../animation/fade_animation.dart';

class ContainerWithBest extends StatelessWidget {
  final String text;
  final bool show;
  final double width;
  final double height;
  const ContainerWithBest({Key? key,required this.text, this.show=false, this.width=400, this.height=700}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return show
        ? Positioned(
      left: 200,
      child: FadeAnimation(
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration:  BoxDecoration(color: Colors.white.withOpacity(0.5)),
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    )
        : const SizedBox.shrink();
  }
}

class ContainerWithBestSmall extends StatelessWidget {
  final String text;
  final bool show;
  final double height;
  const ContainerWithBestSmall({Key? key,required this.text, this.show=false, this.height=700}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: show
          ? FadeAnimation(
            child: SizedBox(
              height: height,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
          : const SizedBox.shrink(),
    );
  }
}

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
    return RepaintBoundary(
      child: AvatarGlow(
          endRadius: 50,
          glowColor: Colors.white,
          duration: const Duration(seconds: 3),
          repeat: true,
          showTwoGlows: true,
          curve: Curves.easeOutQuart,
          child: Icon(
            Icons.add_circle,
            color: widget.isHovering ? const Color(0XFF52B060) : Colors.white,
            size: 50,
          )),
    );
  }
}