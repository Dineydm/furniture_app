class Item {
  String name;
  String imagePath;
  int? discountPercent;
  double originPrice;
  double rating;

  Item(
    this.name,
    this.imagePath,
    this.originPrice,
    this.rating, {
    this.discountPercent,
  });

  double get price {
    return discountPercent != null
        ? (originPrice - (originPrice * discountPercent! / 100))
        : originPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);

    return '\$ $money';
  }
}
