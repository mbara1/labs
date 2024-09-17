// Определение миксина PrintDetailsMixin
mixin PrintDetailsMixin {
  void printArea(name, area) {
    print('Площадь $name: $area');
  }

  void printPerimeter(name, perimeter) {
    print('Периметер $name: $perimeter');
  }
}
