import 'package:flutter/material.dart';
import '../animation/fade_animation.dart';

class ContainerWithBest extends StatelessWidget {
  final String text;
  final bool show;
  const ContainerWithBest({Key? key,required this.text, this.show=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return show
        ? Positioned(
      left: 200,
      child: FadeAnimation(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: 300,
          height: 700,
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
