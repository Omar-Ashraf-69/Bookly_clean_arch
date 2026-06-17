
import 'package:bookly_clean_arch/core/database/api/end_points.dart';

class Rating {
  Rating({required this.average});

  final double? average;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(average: (json[ApiKey.average] as num?)?.toDouble());
  }
}
