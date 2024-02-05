import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class MyCircularGradientIconButton extends StatelessWidget {
  double size;
  IconData icon;
  List<Color> colorsList;
  Function onTap;
  MyCircularGradientIconButton(
      {required this.size,
      required this.icon,
      required this.colorsList,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        onTap();
      },
      child: Container(
        width: size,
        height: size,
        margin: EdgeInsets.all(size / 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              colors: colorsList,
            )),
        child: Icon(
          icon,
          size: size / 2,
          color: Colors.white,
        ),
      ),
    );
  }
}
