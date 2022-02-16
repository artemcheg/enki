import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final double begin;
  final double end;
  final Duration duration;

  const FadeAnimation({Key? key, required this.child, this.begin = 0, this.end = 1, this.duration=const Duration(seconds: 1)}) : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: widget.begin, end: widget.end).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation,child: widget.child,);
  }
}
