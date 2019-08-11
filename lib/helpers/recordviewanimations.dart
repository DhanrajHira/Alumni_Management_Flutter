import 'package:flutter/material.dart';

class RecordViewSlideFadeTransition extends StatefulWidget {
  final Widget child;
  final Animation<Offset> slideanimation;
  final Animation<double> opacityanimation;

  RecordViewSlideFadeTransition(
      {this.opacityanimation, this.child, this.slideanimation});
  @override
  State<StatefulWidget> createState() {
    return RecordViewSlideFadeTransitionState();
  }
}

class RecordViewSlideFadeTransitionState
    extends State<RecordViewSlideFadeTransition> {
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.slideanimation,
      child: FadeTransition(
        opacity: widget.opacityanimation,
        child: widget.child,
      ),
    );
  }
}
