import 'package:flutter/material.dart';

class FadeSlide extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset offset;

  const FadeSlide({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, 0.1),
  });

  @override
  State<FadeSlide> createState() => _FadeSlideState();
}

class _FadeSlideState extends State<FadeSlide> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : widget.offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}

