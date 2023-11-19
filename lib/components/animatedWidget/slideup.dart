import 'package:flutter/material.dart';
import 'package:movie_booking/components/animatedWidget/fade.dart';

class SlideUpTween extends StatelessWidget {
  const SlideUpTween({
    Key? key,
    required this.child,
    required this.begin,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 750),
  }) : super(key: key);
  final Widget child;
  final Offset begin;
  final Curve curve;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: const Offset(0, 0)),
      duration: duration,
      curve: curve,
      builder: (_, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  } // TweenAnimationBuilder
}

class SlideUpOpacityTween extends StatelessWidget {
  const SlideUpOpacityTween({
    Key? key,
    required this.child,
    required this.begin,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 750),
  }) : super(key: key);
  final Widget child;
  final Offset begin;
  final Curve curve;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return OpacityTween(
      child: TweenAnimationBuilder<Offset>(
        tween: Tween(begin: begin, end: const Offset(0, 0)),
        duration: duration,
        curve: curve,
        builder: (_, value, child) {
          return Transform.translate(offset: value, child: child);
        },
        child: child,
      ),
    );
  } // TweenAnimationBuilder
}
