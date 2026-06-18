import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/widgets/book_details_text_widgets.dart';
import 'package:bookly_clean_arch/core/widgets/custom_book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import '../../../../../core/utils/styles.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookCoverWidget(img: book.image),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            book.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.interRegular30,
          ),
        ),
        SizedBox(height: 4),
        Text(book.author, style: AppStyles.montserratMedium18),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 2),
            RatingTextWidget(book: book),
            SizedBox(width: 4),
            ReviewsTextWidget(book: book),
          ],
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45.h,
                  //              width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "${(book.id % 100).toString()} \$",
                      style: AppStyles.montserratBold20.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 45.h,
                  // width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Free Preview",
                      style: AppStyles.interRegular16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
