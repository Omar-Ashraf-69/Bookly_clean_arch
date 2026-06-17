import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/models/sub_models/author_model.dart';
import 'package:bookly_clean_arch/core/models/sub_models/rating_model.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.rating,
    required super.image,
    this.subtitle,
    required this.authors,
  });

  final String? subtitle;
  final List<Author> authors;

  factory BookModel.fromJson(Map<String, dynamic> json) {

    final authorsJson = json[ApiKey.authors] as List<dynamic>?;

    final authorsList = authorsJson == null
        ? <Author>[]
        : authorsJson.map((x) => Author.fromJson(x)).toList();
    return BookModel(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      subtitle: json[ApiKey.subtitle],
      authors: json[ApiKey.authors] == null
          ? []
          : List<Author>.from(
              json[ApiKey.authors]!.map((x) => Author.fromJson(x)),
            ),
      rating: json[ApiKey.rating] == null
          ? null
          : Rating.fromJson(json[ApiKey.rating]).average,
      author: authorsList.isNotEmpty ? authorsList.first.name : '',
      image: json[ApiKey.image],

      // author: json[ApiKey.authors] == null
      //     ? ''
      //     : json[ApiKey.authors]!.map((x) => Author.fromJson(x)),
    );
  }
}
