// ignore_for_file: avoid_print

import 'dart:math';

class TableOfLengthAPI {
  TableOfLengthOfRingDataBase tableOfLength = TableOfLengthOfRingDataBase();

  double calculateLength(double thickness, double size) {
    double? innerDiameter = TableOfLengthOfRingDataBase.ringSizeData[size];
    if (innerDiameter != null) {
      double length = (thickness + innerDiameter) * pi;
      return length;
    } else {
      print('Size $size not found in the ringSizeData map.');
      return -1;
    }
  }

  List<double> getAllSizes() {
    // Retrieve all sizes types from the TableOfLength
    List<double> allRingSizes =
        List.from(TableOfLengthOfRingDataBase.ringSizeData.keys);

    return allRingSizes;
  }
}

class TableOfLengthOfRingDataBase {
  static Map<double, double> ringSizeData = {
    3.00: 14.05,
    3.25: 14.25,
    3.50: 14.45,
    3.75: 14.65,
    4.00: 14.86,
    4.25: 15.04,
    4.50: 15.27,
    4.75: 15.53,
    5.00: 15.70,
    5.25: 15.90,
    5.50: 16.10,
    5.75: 16.30,
    6.00: 16.51,
    6.25: 16.71,
    6.50: 16.92,
    6.75: 17.13,
    7.00: 17.35,
    7.25: 17.45,
    7.50: 17.75,
    7.75: 17.97,
    8.00: 18.19,
    8.25: 18.35,
    8.50: 18.53,
    8.75: 18.69,
    9.00: 18.89,
    9.25: 19.22,
    9.50: 19.41,
    9.75: 19.62,
    10.00: 19.84,
    10.25: 20.02,
    10.50: 20.20,
    10.75: 20.44,
    11.00: 20.68,
    11.25: 20.85,
    11.50: 21.08,
    11.75: 21.24,
    12.00: 21.49,
    12.25: 21.69,
    12.50: 21.89,
    12.75: 22.10,
    13.00: 22.33,
    13.25: 22.53,
    13.50: 22.60,
  };
}
