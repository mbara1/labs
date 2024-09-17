import 'package:lab2/models/print_details_mixin.dart';
import 'package:lab2/models/shape_abstract.dart';

class Rectangle extends Shape with PrintDetailsMixin {
  String name = 'Rectangle';
  double _width;
  double _height;

  Rectangle(this._width, this._height);

  // Getter для ширины
  double get width => _width;

  // Getter для высоты
  double get height => _height;

  // Setter для ширины
  set width(double width) {
    _width = width;
  }

  // Setter для высоты
  set height(double height) {
    _height = height;
  }

  @override
  double calculateArea() {
    return width * height;
  }
}
