import 'package:lily/app/data/entity/flower.dart';

class Type {
  final String name;
  final List<Flower> flowers;
  bool isSelected;

  Type({
    required this.name,
    required this.flowers,
    this.isSelected = false,
  });

  void diselect() {
    isSelected = false;
  }

  void select() {
    isSelected = true;
  }
}
