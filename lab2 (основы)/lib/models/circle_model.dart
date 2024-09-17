import 'package:lab2/models/print_details_mixin.dart';
import 'package:lab2/models/shape_abstract.dart';

class Circle extends Shape with PrintDetailsMixin {
  static const double pi = 3.14;

  String name = 'Circle';
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * radius * radius;
  }

  //Длина окружности
  static double calculateCircumference(double radius) {
    return 2 * pi * radius;
  }
}
