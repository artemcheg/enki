import 'dart:async';

import 'package:flutter/material.dart';

import 'direction.dart';

class TransitionAnimation extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direct direct;
  final Duration durationStart;
  final Duration animTime;


  const TransitionAnimation({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direct = Direct.vertical,
    this.durationStart = const Duration(seconds: 0),
    this.animTime = const Duration(milliseconds: 800),
    Key? key,
  }) : super(key: key);

  @override
  _TransitionAnimationState createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;
  late AnimationController _controller;
  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.animTime);

    if (widget.direct == Direct.vertical) {
      _animationSlide = Tween<Offset>(
              begin: Offset(0, widget.offset), end: const Offset(0, 0))
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    } else {
      _animationSlide = Tween<Offset>(
              begin: Offset(widget.offset, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    }

    _animationFade = Tween<double>(begin: -1.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Timer(widget.durationStart, () {
        _controller.forward();
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FadeTransition(
        opacity: _animationFade,
        child: SlideTransition(
          position: _animationSlide,
          child: widget.child,
        ),
      ),
    );
  }
}



class TransitionAnimationContainer extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direct direct;
  final Duration durationStart;
  final Duration animTime;
  final bool forward;

  const TransitionAnimationContainer({
    required this.child,
    this.offset = -1.0,
    this.curve = Curves.easeIn,
    this.direct = Direct.horizontal,
    this.durationStart = const Duration(seconds: 0),
    this.animTime = const Duration(milliseconds: 400),
    Key? key,
    this.forward = false,
  }) : super(key: key);

  @override
  _TransitionAnimationContainerState createState() => _TransitionAnimationContainerState();
}

class _TransitionAnimationContainerState extends State<TransitionAnimationContainer>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;
  late AnimationController _controller;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.animTime);

    if (widget.direct == Direct.vertical) {
      _animationSlide = Tween<Offset>(
          begin: Offset(0, widget.offset), end: const Offset(0, 0))
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    } else {
      _animationSlide = Tween<Offset>(
          begin: Offset(widget.offset, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    }

    _animationFade = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Timer(widget.durationStart, () {
    //   _controller.forward();
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.forward==false){
      _controller.reverse();
    }else{
      _controller.forward();
    }
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position:_animationSlide,
        child: widget.child,
      ),
    );
  }
}