// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class MyShapes {
  double textFiledPadding = 10.5;
  double sizeBoxWidth = 15;
  String textFiledHintText = "Enter number";

  double get thickness;
  double calculateArea();

  double calculateVolume(double area, double length) {
    double volume = area * length;
    return volume;
  }

  Widget buildWidget(BuildContext context, bool isCustomerBuild);
}
