
import 'package:bookly_clean_arch/core/database/api/end_points.dart';

class SimilarBookModel {
  SimilarBookModel({
    required this.id,
    required this.title,
    required this.image,
  });

  final int id;
  final String title;
  final String? image;

  factory SimilarBookModel.fromJson(Map<String, dynamic> json) {
    return SimilarBookModel(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      image: json[ApiKey.image],
    );
  }
  Map<String, dynamic> toJson() => {
    ApiKey.id: id,
    ApiKey.title: title,
    ApiKey.image: image,
  };
}
