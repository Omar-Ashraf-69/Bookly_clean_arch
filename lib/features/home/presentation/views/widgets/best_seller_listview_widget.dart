import 'package:bookly_clean_arch/core/widgets/best_seller_list_item.dart';
import 'package:bookly_clean_arch/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewWidget extends StatelessWidget {
  const BestSellerListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 48),
              child: ListView.builder(
                itemCount: state.books.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return BestSellerListItemWidget(book: state.books[index]);
                },
              ),
            ),
          );
        } else if (state is HomeFailureState) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
