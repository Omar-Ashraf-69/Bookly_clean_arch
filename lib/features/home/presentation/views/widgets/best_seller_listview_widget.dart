import 'package:bookly_clean_arch/core/widgets/best_seller_list_item.dart';
import 'package:flutter/material.dart';

class BestSellerListViewWidget extends StatelessWidget {
  const BestSellerListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 48),
        child: ListView.builder(
          itemCount: 12,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return BestSellerListItemWidget();
          },
        ),
      ),
    );
  }
}
