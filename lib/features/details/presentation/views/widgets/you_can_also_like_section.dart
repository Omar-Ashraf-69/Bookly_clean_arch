import '../../../../../core/utils/styles.dart';
import 'you_can_also_like_listview_widget.dart';
import 'package:flutter/material.dart';

class YouCanAlsoLikeSection extends StatelessWidget {
  const YouCanAlsoLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Align(
              alignment: AlignmentGeometry.centerStart,
              child: Text(
                "You can also like",
                style: AppStyles.montserratSemiBold14,
              ),
            ),
          ),
          SizedBox(height: 12),
          YouCanAlsoLikeListViewWidget(),
        ],
      ),
    );
  }
}
