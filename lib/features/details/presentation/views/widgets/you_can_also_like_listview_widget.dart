
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';

class YouCanAlsoLikeListViewWidget extends StatelessWidget {
  const YouCanAlsoLikeListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: ListView.builder(
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Image.asset(Assets.imagesCover),
            );
          },
        ),
      ),
    );
  }
}
