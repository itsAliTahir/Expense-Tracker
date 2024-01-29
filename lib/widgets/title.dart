import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String title;
  bool transition;
  CustomTitle({required this.title, this.transition = false, super.key});

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      fadingDuration: transition == true
          ? const Duration(seconds: 1)
          : const Duration(seconds: 0),
      slidingBeginOffset:
          transition == true ? const Offset(0, 0.4) : const Offset(0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 1.5,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ),
    );
  }
}
