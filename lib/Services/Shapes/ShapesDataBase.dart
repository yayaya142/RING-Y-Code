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
    "Circle",
    "Semi Circle",
    "Square",
    "Rectangle",
    "Sheet",
  ];
}
