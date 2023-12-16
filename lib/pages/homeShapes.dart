// ignore_for_file: prefer_const_constructors

import 'package:or_calculator/Services/Shapes/Circle.dart';
import 'package:or_calculator/Services/Shapes/Hexagon.dart';
import 'package:or_calculator/Services/Shapes/Rectangle.dart';
import 'package:or_calculator/Services/Shapes/SemiCircle.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/Services/Shapes/Sheet.dart';
import 'package:or_calculator/Services/Shapes/Square.dart';

class CreateShapeObject {
  MyShapes createShape(
      String className, double diameter, double width, double thickness) {
    switch (className) {
      case 'Circle':
        return MyCircle(diameter);
      case 'Semi Circle':
        return MySemiCircle(diameter);
      case 'Rectangle':
        return MyRectangle(width, thickness);
      case 'Square':
        return MySquare(width);
      case 'Sheet':
        return MySheet(width, thickness);
      case 'Hexagon':
        return MyHexagon(width);
      default:
        return MySquare(0);
    }
  }
}
