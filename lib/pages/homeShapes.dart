// ignore_for_file: prefer_const_constructors

import 'package:or_calculator/Services/Shapes/Circle.dart';
import 'package:or_calculator/Services/Shapes/Hexagon.dart';
import 'package:or_calculator/Services/Shapes/Rectangle.dart';
import 'package:or_calculator/Services/Shapes/SemiCircle.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/Services/Shapes/Square.dart';

class CreateShapeObject {
  MyShapes createShape(
      String className, double diameter, double width, double thickness) {
    switch (className) {
      case 'Round Wire':
        return MyCircle(diameter);
      case 'Half Round Wire':
        return MySemiCircle(diameter);
      case 'Rectangular Wire':
        return MyRectangle(width, thickness);
      case 'Square Wire':
        return MySquare(width);
      case 'Hexagon Wire':
        return MyHexagon(width);
      default:
        return MySquare(0);
    }
  }
}
