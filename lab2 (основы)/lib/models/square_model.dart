import 'package:lab2/exception/invalid_parameter_exception.dart';
import 'package:lab2/models/perimeter_calculation_interface.dart';
import 'package:lab2/models/print_details_mixin.dart';
import 'package:lab2/models/shape_abstract.dart';

// Класс Square, наследующий от Shape, использующий миксин PrintDetailsMixin и реализующий интерфейс PerimeterCalculation
class Square extends Shape with PrintDetailsMixin implements PerimeterCalculation {
  String name = 'Square';
  double side;

  // Конструктор с именованными параметрами + Обработка собственного исключения
  Square({required this.side}) {
    if (side <= 0) {
      throw InvalidParameterException('Длина стороны должна быть больше нуля');
    }
  }

  // Именованный конструктор
  Square.fromWidthAndHeight(double width, double height)
      : side = (width + height) / 2;

  @override
  double calculatePerimeter() {
    return 4 * side;
  }

  @override
  double calculateArea() {
    return side * side;
  }
}
