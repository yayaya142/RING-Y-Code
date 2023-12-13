import 'package:or_calculator/Services/DensityTableDataBase.dart';

// this api use to find the density of the metal base on the metal type
// it use the DensityDatabase to find the density
class GetDensityAPI {
  double getDensity(String metalType) {
    try {
      if (DensityDatabase.metalData.containsKey(metalType)) {
        final density = DensityDatabase.metalData[metalType];
        return density!;
      } else {
        throw Exception("Metal type '$metalType' not found in the database.");
      }
    } catch (e) {
      print("Error: $e");
      return 0.0;
    }
  }

  List<String> getAllMetalTypes() {
    // Retrieve all metal types from the DensityDatabase
    List<String> metalTypes = DensityDatabase.metalData.keys.toList();
    return metalTypes;
  }
}
