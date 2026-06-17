import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/features/presentation/home/presentation/views/widgets/best_seller_listview_widget.dart';
import 'package:bookly_clean_arch/features/presentation/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly_clean_arch/features/presentation/search/presentation/view/widgets/search_view_custom_appbar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchViewBody();
  }
}

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 32, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchViewCustomAppbarWidget(),
              SizedBox(height: 14),
              CustomSearchTextField(),
              SizedBox(height: 14),
              Text("Best Seller", style: AppStyles.montserratSemiBold18),
              SizedBox(height: 18),
              BestSellerListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
