import 'package:bookly_clean_arch/core/utils/app_routers.dart';
import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:bookly_clean_arch/core/widgets/best_seller_list_item.dart';
import 'package:bookly_clean_arch/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestResultWidget extends StatelessWidget {
  const BestResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Expanded(
            child: Align(
              alignment: AlignmentGeometry.center,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is SearchFaileur) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is SearchSuccess) {
          final books = state.books;
          if (books.isEmpty) {
            return const CustomCenteredTextWidget(
              text: "No Result Was found :)",
            );
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 48),
              child: ListView.builder(
                itemCount: books.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => GoRouter.of(
                      context,
                    ).push(AppRouters.kDetailsView, extra: books[index]),
                    child: BestSellerListItemWidget(book: books[index]),
                  );
                },
              ),
            ),
          );
        }
        return CustomCenteredTextWidget(text: "Start Searching... ");
      },
    );
  }
}

class CustomCenteredTextWidget extends StatelessWidget {
  const CustomCenteredTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: AlignmentGeometry.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.interRegular30,
        ),
      ),
    );
  }
}
