import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class BookDetailsWidget extends StatelessWidget {
  const BookDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesCover,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.height / 3,
        ),
        SizedBox(height: 32),
        Text("The Jungle Book", style: AppStyles.interRegular30),
        SizedBox(height: 4),
        Text("Rudyard Kipling", style: AppStyles.montserratMedium18),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 4),
            Text("4.2"),
            SizedBox(width: 4),
            Text("(4212)"),
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
                      "19.9\$",
                      style: AppStyles.montserratSemiBold18.copyWith(
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
