
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceTextWidget extends StatelessWidget {
  const PriceTextWidget({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${(book.id % 100).toString()}\$",
      style: AppStyles.montserratBold20,
    );
  }
}

class ReviewsTextWidget extends StatelessWidget {
  const ReviewsTextWidget({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Text(
      ("(${book.id.toString().substring(0, 3)})"),
      overflow: TextOverflow.ellipsis,
      style: AppStyles.montserratRegular14,
    );
  }
}

class RatingTextWidget extends StatelessWidget {
  const RatingTextWidget({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Text(
      ((book.rating ?? 0) * 10).toStringAsFixed(
        1,
      ),
      style: AppStyles.montserratMedium16,
    );
  }
}
