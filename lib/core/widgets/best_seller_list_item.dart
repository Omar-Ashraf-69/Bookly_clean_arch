import 'package:bookly_clean_arch/core/utils/assets.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class BestSellerListItemWidget extends StatelessWidget {
  const BestSellerListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              Assets.imagesCover,
              width: 80.w,
              // width: MediaQuery.of(context).size.width / 3,
            ),
            SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harry Potter and the Goblet of Fire ",
                    style: AppStyles.interRegular20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "J.K. Rowling",
                    style: AppStyles.montserratMedium14.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  Row(
                    children: [
                      Text("19.99\$", style: AppStyles.montserratBold20),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18.w),
                          SizedBox(width: 4),
                          Text("4,8", style: AppStyles.montserratMedium16),
                          SizedBox(width: 4),
                          Text("(4321)", style: AppStyles.montserratRegular14),
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
