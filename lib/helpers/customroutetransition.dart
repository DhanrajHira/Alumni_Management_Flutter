import 'package:flutter/material.dart';

class SlideUpRoute<T> extends MaterialPageRoute<T> {
  SlideUpRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
          child: child),
    );
  }
}

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(
      child: child,
      opacity: animation,
    );
  }
}
