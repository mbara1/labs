import 'package:lab2/models/shape_3d_abstract.dart';

// Класс Cube, наследующий от Shape3D и реализующий метод calculateVolume
class Cube extends Shape3D {
  double sideLength;

  Cube(this.sideLength);

  @override
  double calculateVolume() {
    return sideLength * sideLength * sideLength;
  }
}
