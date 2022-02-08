import 'dart:async';

import 'package:flutter/material.dart';

import 'direction.dart';

class ScrollAnimation extends StatefulWidget {
  final GlobalKey parentKey;
  final Widget child;
  final double offset;
  final Curve curve;
  final Direct direct;
  final Duration durationStart;
  final Duration animTime;
  final ScrollController scrollController;

  const ScrollAnimation(
      {Key? key,
      required this.parentKey,
      required this.child,
      this.offset = 1.0,
      this.curve = Curves.easeIn,
      this.direct = Direct.vertical,
      this.durationStart = const Duration(seconds: 0),
      this.animTime = const Duration(milliseconds: 700),
      required this.scrollController})
      : super(key: key);

  @override
  _ScrollAnimationState createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation>
    with SingleTickerProviderStateMixin {
  final childKey = GlobalKey();
  late Animation<Offset> _animationSlide;
  late AnimationController _controller;
  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animTime,
    );

    widget.scrollController.addListener(() {
      _updateAnimatedBoxEnterAnimation();
    });

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
  }

  static const enterAnimationMinHeight = -500;

  _updateAnimatedBoxEnterAnimation() {
    if (_controller.status != AnimationStatus.dismissed) {
      return; // animation already in progress/finished
    }

    RenderObject? listViewObject =
        widget.parentKey.currentContext?.findRenderObject();
    RenderObject? animatedBoxObject =
        childKey.currentContext?.findRenderObject();
    if (listViewObject == null || animatedBoxObject == null) return;

    final listViewHeight = listViewObject.paintBounds.height;
    final animatedObjectTop =
        animatedBoxObject.getTransformTo(listViewObject).getTranslation().y;





    final animatedBoxVisible =
        (animatedObjectTop + enterAnimationMinHeight < listViewHeight);
    if (animatedBoxVisible) {
      // start animation
      Timer(widget.durationStart,(){
        _controller.forward();
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      key: childKey,
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}
