// ignore_for_file: unused_local_variable

import 'package:or_calculator/Services/GetDensityAPI.dart';
import 'package:or_calculator/Services/Shapes/Shapes.dart';
import 'package:or_calculator/Services/properties_table.dart';

class Calculator {
  static List<dynamic> convertVolume(MyShapes customerShape,
      MyShapes stockShape, double size, String metalType) {
    StringBuffer showSteps = StringBuffer();
    // calculate customer volume
    double customerShapeArea = customerShape.calculateArea();
    double customerShapeLength = calculateLength(customerShape.thickness, size);
    double customerShapeVolume =
        customerShape.calculateVolume(customerShapeArea, customerShapeLength);
    // calculate stock
    double stockShapeArea = stockShape.calculateArea();
    double stockShapeLength = (customerShapeVolume / stockShapeArea);
    // calculate stock weight
    double customerShapeWeight =
        customerShapeLength * customerShapeArea * getDensity(metalType);
    double stockShapeWeight = customerShapeWeight;
    double stockShapeVolume =
        stockShape.calculateVolume(stockShapeArea, stockShapeLength);

    double innerDiameter = TableOfLengthAPI().getInnerDiameter(size);
    // check if solution make sense
    if (customerShapeArea <= 0 || customerShapeVolume <= 0) {
      return ["Error", -1.0, -1.0, -1.0];
    }

    // write steps
    // write customer steps
    String formatSpaces = "•         ";
    showSteps.write("Ring wire: ${customerShape.showShapeInfo()}\n");
    showSteps.write(
        "$formatSpaces Length = ${customerShapeLength.toStringAsFixed(1)} [mm]\n");
    showSteps.write(
        "$formatSpaces Cross section = ${customerShapeArea.toStringAsFixed(1)} [mm^2]\n");
    showSteps.write(
        "$formatSpaces Weight = ${customerShapeWeight.toStringAsFixed(1)} [gr]\n");
    showSteps.write(
        "$formatSpaces Inner diameter = ${innerDiameter.toStringAsFixed(2)} [mm]\n\n");

    // write stock steps
    if (!(stockShapeLength <= 0 ||
        stockShapeLength.isInfinite ||
        stockShapeLength.isNaN ||
        stockShapeWeight <= 0 ||
        stockShapeWeight.isInfinite ||
        stockShapeWeight.isNaN)) {
      // write stock steps as normal
      showSteps.write("Stock wire: ${stockShape.showShapeInfo()}\n");

      showSteps.write(
          "$formatSpaces Length = ${stockShapeLength.toStringAsFixed(1)} [mm]\n");
      showSteps.write(
          "$formatSpaces Cross section = ${stockShapeArea.toStringAsFixed(1)} [mm^2]\n");
      showSteps.write(
          "$formatSpaces Weight = ${stockShapeWeight.toStringAsFixed(1)} [gr]\n");
    }

    // Create a list to store the results
    List<dynamic> results = [
      showSteps.toString(),
      customerShapeLength,
      stockShapeLength,
      stockShapeWeight,
    ];
    return results;
  }

  static double calculateLength(double thickness, double size) {
    double result = TableOfLengthAPI().calculateLength(thickness, size);
    return result;
  }

  static double getDensity(String metalType) {
    double density = GetDensityAPI().getDensity(metalType);
    return density;
  }
}
