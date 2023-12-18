// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:or_calculator/theme.dart';

abstract class MyShapes {
  double textFiledPadding = 7;
  double sizeBoxWidth = 15;
  String textFiledHintText = "Type";
  String shapesTextFont = ThemeColors().shapesFont;
  String shapesInputBoxFont = ThemeColors().shapesInputBoxFont;

  Color shapesTextColor = ThemeColors().shapesTextColor;
  Color shapesBoxHintColor = ThemeColors().shapesBoxHintColor;
  Color shapesInputBoxContainerColor =
      ThemeColors().shapesInputBoxContainerColor;

  Color shapesContainerColor = ThemeColors().shapesContainerColor;

  double get thickness;
  double calculateArea();

  double calculateVolume(double area, double length) {
    double volume = area * length;
    return volume;
  }

  Widget buildWidget(BuildContext context, bool isCustomerBuild);
  // decide if to show it as A1 or A2
  TeXViewDocument showAreaFunctionLatex(int areaNumber);

  String showShapeInfo();

  void clearTextField();
}
