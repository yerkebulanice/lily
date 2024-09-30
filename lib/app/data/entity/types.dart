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

  // Method to copy the current instance and modify specific fields
  Type copyWith({
    String? name,
    List<Flower>? flowers,
    bool? isSelected,
  }) {
    return Type(
      name: name ?? this.name,
      flowers: flowers ?? this.flowers,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  void diselect() {
    isSelected = false;
  }

  void select() {
    isSelected = true;
  }
}
