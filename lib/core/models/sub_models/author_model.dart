
import 'package:bookly_clean_arch/core/database/api/end_points.dart';

class Author {
  Author({required this.id, required this.name});

  final int id;
  final String name;

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(id: json[ApiKey.id], name: json[ApiKey.name]);
  }
}
