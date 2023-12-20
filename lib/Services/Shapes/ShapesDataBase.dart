// ignore_for_file: file_names

class ShapeDataBaseAPI {
  List<String> getShapes() {
    List<String> shapes = ShapeDataBase.shapes;
    shapes.sort(); // Sort the list alphabetically
    return shapes;
  }
}

class ShapeDataBase {
  static List<String> shapes = [
    "Round Wire",
    "Half Round Wire",
    "Square Wire",
    "Rectangular Wire",
    "Hexagon Wire",
  ];
}
