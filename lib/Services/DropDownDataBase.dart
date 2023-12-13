// ignore_for_file: prefer_const_constructors

// Dropdown menu options
import 'package:or_calculator/Services/GetDensityAPI.dart';
import 'package:or_calculator/Services/Shapes/ShapesDataBase.dart';
import 'package:or_calculator/Services/properties_table.dart';

class SizeOptionsDropDown {
  static List<double> sizes = TableOfLengthAPI().getAllSizes();
  
}

class MetalOptionsDropDown {
  static List<String> metal = GetDensityAPI().getAllMetalTypes();
}

class ShapeOptionsDropDown {
  static List<String> shapes = ShapeDataBaseAPI().getShapes();
}


