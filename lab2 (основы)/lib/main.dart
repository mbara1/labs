import 'models/circle_model.dart';
import 'models/cube_model.dart';
import 'models/rectangle_model.dart';
import 'models/shape_abstract.dart';
import 'models/sphere_model.dart';
import 'models/square_model.dart';

void main() {
  //Square
  print('------------Square------------');

  List<Square> squares = [
    Square(side: 5.0),
    Square.fromWidthAndHeight(4.0, 4.0)
  ];

  for (var square in squares) {
    square.printArea(square.name, square.calculateArea());
    square.printPerimeter(square.name, square.calculatePerimeter());
  }

  try {
    Square square = Square(side: -5);
    square.printArea(square.name, square.calculateArea());
  } catch (e) {
    print('Ошибка: $e');
  }

  //Rectangle
  print('\n------------Rectangle------------');

  Rectangle rectangle = Rectangle(4.0, 5.0);
  rectangle.printArea(rectangle.name, rectangle.calculateArea());

  rectangle.width = 6.0;
  rectangle.height = 7.0;
  print('Новые значения:');
  rectangle.printArea(rectangle.name, rectangle.calculateArea());


  //Circle
  print('\n------------Circle------------');

  Circle circle = Circle(2);
  circle.printArea(circle.name, circle.calculateArea());
  print('Длина окружности: ${Circle.calculateCircumference(circle.radius)}');

  //Cube
  print('\n------------Cube------------');

  Cube cube = Cube(3.0);
  double cubeVolume = cube.calculateVolume();
  print('Объем куба: $cubeVolume');

  cube.printVolume(cubeVolume);
  cube.printDetails(name: 'Cube', volume: cubeVolume);
  cube.printInfo('Cube', cubeVolume);


  //Sphere
  print('\n------------Sphere------------');

  Sphere sphere = Sphere(2.0);
  double sphereVolume = sphere.calculateVolume();
  print('Объем сферы: $sphereVolume');

  sphere.printVolume(sphereVolume);
  sphere.printDetails(name: 'Sphere', volume: sphereVolume);
  sphere.printInfo('Sphere', sphereVolume);

  //Shape
  print('\n------------Shape------------');

  List<Shape> shapes = [
    Square(side: 3.0),
    Circle(2.0),
    Rectangle(4, 8.3)
  ];

  for (var shape in shapes) {
    print('Фигура: ${shape.name}. Площадь: ${shape.calculateArea()}');
  }

  //unique
  print('\n------------unique------------');

  Set<double> uniqueSideLengths = {1.0, 4.0, 5.0, 1.0, 1.0};

  print('Уникальные длины сторон:');
  for (var length in uniqueSideLengths) {
    print(length);
  }

  //continue
  print('\n------------continue------------');

  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      continue;
    }
    print('i = $i');
  }

  //break
  print('\n------------break------------');

  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      break;
    }
    print('i = $i');
  }

  //try-catch
  print('\n------------try-catch------------');

}
