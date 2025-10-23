import 'package:flutter/material.dart';

class PagesAnimation extends PageRouteBuilder {
  final Widget route;
  PagesAnimation({required this.route})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route;
        },

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slideAnimation = Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(position: slideAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 1000),
      );
}
