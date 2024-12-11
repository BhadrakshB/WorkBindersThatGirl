class RelatedProduct {
  final String title;
  final String currPrice;
  final String image;

  RelatedProduct({required this.title, required this.currPrice, required this.image});

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      title: json['title'],
      currPrice: json['currPrice'],
      image: json['image'],
    );
  }
}
