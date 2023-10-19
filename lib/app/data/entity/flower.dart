class Flower {
  final String image;
  final String name;
  final int price;
  bool isLiked = false;

  void changeLike() {
    isLiked = !isLiked;
  }

  Flower({
    required this.image,
    required this.name,
    required this.price,
  });
}
