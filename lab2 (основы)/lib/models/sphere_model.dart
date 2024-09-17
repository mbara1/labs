import 'package:lab2/models/shape_3d_abstract.dart';

// Класс Sphere, наследующий от Shape3D и реализующий метод calculateVolume
class Sphere extends Shape3D {
  double radius;

  Sphere(this.radius);

  @override
  double calculateVolume() {
    return (4 / 3) * 3.14 * radius * radius * radius;
  }
}
