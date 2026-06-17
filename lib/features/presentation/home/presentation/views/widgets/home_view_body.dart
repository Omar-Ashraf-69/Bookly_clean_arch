import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'best_seller_listview_widget.dart';
import 'books_listview_widget.dart';
import 'home_view_customer_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14),
            HomeViewCustomAppbarWidget(),
            SizedBox(height: 14),
            BooksListViewWidget(),
            SizedBox(height: 14),
            Text("Best Seller", style: AppStyles.montserratSemiBold18),
            SizedBox(height: 18),
            BestSellerListViewWidget(),
          ],
        ),
      ),
    );
  }
}
