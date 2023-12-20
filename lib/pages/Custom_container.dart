import 'package:flutter/material.dart';

class CustomContainer {
// container size and decoration
// OutSide
  final double containerBoxPadding = 5.0;
  final double containerOutBorderwidth = 2.0;
  final double containerOutsideBorderRadius = 15;
// Inner
  final double containerInnerBorderwidth = 1.0;
  final double containerInnerSideBorderRadius = 15;
//  Container size base on screen size
  double containerWidth = 0.8;
  double containerHeight = 0.05;
// container size for shapes size
  double containerWidthForShapesType = 1.55;
  double containerHeightForShapesType = 1.2;
  double containerWidthForShapesData = 3;
  double containerHeightForShapesData = 1.2;
  // container size result
  double containerWidthForResult = 0.8;
  double containerHeightForResult = 0.2;
  double containerOutsideBorderRadiusForResult = 40;

// Pages colors
  Color outsideContainerColor = const Color.fromARGB(255, 0, 0, 0);
  Color insideContainerColor = Colors.white.withOpacity(0.5);

// Divider size & Color
  final double dividerSize = 5;
  final Color dividerColor = Colors.black;
}
