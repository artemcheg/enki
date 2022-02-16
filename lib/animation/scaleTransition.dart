import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final double endScale;
  final Duration duration;

  const ScaleAnimation(
      {Key? key,
      required this.child,
      this.beginScale = 1.3,
      this.endScale = 1,
      this.duration = const Duration(seconds: 15)})
      : super(key: key);

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;
  var squareScaleA = 0.5;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: widget.beginScale, end: widget.endScale)
        .animate(_controller);
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
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}




class ScaledContainer extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final double endScale;
  final Duration duration;
  final bool start;

  const ScaledContainer(
      {Key? key,
        required this.child,
        this.beginScale = 1,
        this.endScale = 1.3,
        this.duration = const Duration(seconds: 15), required this.start})
      : super(key: key);

  @override
  _ScaledContainerState createState() => _ScaledContainerState();
}

class _ScaledContainerState extends State<ScaledContainer>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;
  var squareScaleA = 0.5;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: widget.beginScale, end: widget.endScale)
        .animate(_controller);
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
    widget.start?_controller.forward():_controller.reverse();
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}