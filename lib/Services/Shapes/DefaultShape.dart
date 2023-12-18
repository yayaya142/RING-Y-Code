// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_tex/src/widgets/document.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';

class DefaultShape extends MyShapes {
  @override
  double calculateArea() {
    return 0;
  }

  @override
  double get thickness {
    return 0;
  }

  @override
  Widget buildWidget(BuildContext context, bool isCustomerBuild) {
    return const SizedBox.shrink();
  }

  @override
  void clearTextField() {}
  @override
  String showShapeInfo() {
    return "";
  }

  @override
  TeXViewDocument showAreaFunctionLatex(int areaNumber) {
    // TODO: implement showAreaFunctionLatex
    throw UnimplementedError();
  }
}
