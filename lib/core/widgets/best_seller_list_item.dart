import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/core/widgets/book_details_text_widgets.dart';
import 'package:bookly_clean_arch/core/widgets/custom_book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BestSellerListItemWidget extends StatelessWidget {
  const BestSellerListItemWidget({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 6,
              child: AspectRatio(
                aspectRatio: 2.2 / 3,
                child: CustomBookCoverWidget(img: book.image),
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: AppStyles.interRegular20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book.author,
                    style: AppStyles.montserratMedium14.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  Row(
                    children: [
                      PriceTextWidget(book: book),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18.w),
                          SizedBox(width: 4),
                          RatingTextWidget(book: book),
                          SizedBox(width: 4),
                          ReviewsTextWidget(book: book),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
