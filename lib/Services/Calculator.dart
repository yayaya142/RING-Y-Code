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
    double stockShapeWeight =
        stockShapeLength * stockShapeArea * getDensity(metalType);

    // DEBUG print
    print("customerShapeArea: $customerShapeArea");
    print("customerShapeVolume: $customerShapeVolume");
    print("stockShapeArea: $stockShapeArea");
    print("customerShapeLength: $customerShapeLength");
    print("stockShapeLength: $stockShapeLength");
    print("stockShapeWeight: $stockShapeWeight");
    // write steps
    showSteps.write("The formula is:\n");
    showSteps.write("customer length = (thickness + innerDiameter) * pi\n");
    showSteps.write(
        "customer shape length = ${customerShapeLength.toStringAsFixed(2)} \n");
    showSteps.write(
        "customer Shape Volume = customer Shape Area * customer Shape Length\n");
    showSteps.write(
        "${customerShapeVolume.toStringAsFixed(2)} = ${customerShapeArea.toStringAsFixed(2)} * ${customerShapeLength.toStringAsFixed(2)}\n");
    showSteps.write(
        "stock shape area = ${stockShape.calculateArea().toStringAsFixed(2)}\n");
    showSteps.write(
        "stock shape length = customer shape volume / stock shape area\n");
    showSteps.write(
        "${stockShapeLength.toStringAsFixed(2)} = ${customerShapeVolume.toStringAsFixed(2)} / ${stockShape.calculateArea().toStringAsFixed(2)}\n");
    showSteps.write(
        "stock shape weight = stock shape length * stock shape area * density\n");
    showSteps.write(
        "${stockShapeWeight.toStringAsFixed(2)} = ${stockShapeLength.toStringAsFixed(2)} * ${stockShape.calculateArea().toStringAsFixed(2)} * ${getDensity(metalType).toStringAsFixed(2)}\n");
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
