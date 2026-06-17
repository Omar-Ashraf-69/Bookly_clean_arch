
import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String author;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final num? reviews;
  @HiveField(6)
  final num? price;

  BookEntity({
    required this.id,
    required this.title,
    this.image,
    required this.author,
    required this.rating,
    this.reviews,
    this.price,
  });

}
