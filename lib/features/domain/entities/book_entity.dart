class BookEntity {
  BookEntity({
    required this.id,
    required this.title,
    this.image,
    required this.author,
    required this.rating,
    this.reviews,
    this.price,
  });

  final int id;
  final String title;
  final String? image;
  final String author;
  final num? rating;
  final num? reviews;
  final num? price;
}
