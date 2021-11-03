import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/resources/colors.dart';

class Decorations{
  static Decoration createRectangleDecoration(){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(6),
       border: Border.all(
      color: kBordColor,
      width: 2.0,
    ),
    );
  }
}