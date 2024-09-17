// Определение абстрактного класса Shape3D с абстрактным методом calculateVolume
abstract class Shape3D {
  double calculateVolume();

  // Функция с обязательными параметрами
  void printVolume(double volume) {
    print('Объем: $volume');
  }

  // Функция с именованными параметрами
  void printDetails({required String name, required double volume}) {
    print('Фигура: $name, Объем: $volume');
  }

  // Функция с параметрами по умолчанию
  void printInfo(String name, [double volume = 0.0]) {
    print('Фигура: $name, Объем: $volume');
  }
}
