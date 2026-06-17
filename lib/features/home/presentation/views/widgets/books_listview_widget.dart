import 'package:bookly_clean_arch/features/home/presentation/cubit/home_cubit.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListViewWidget extends StatelessWidget {
  const BooksListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouters.kDetailsView);
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(24),
                        child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(24),
                          ),
                          imageUrl: state.books[index].image ?? "",
                          shimmerBackColor: Colors.grey[80],
                          shimmerDuration: Duration(seconds: 2),
                          shimmerBaseColor: Colors.grey[300],

                          errorWidget: Image.asset(
                            Assets.imagesCover, // safest option
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Image.asset(Assets.imagesCover, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              },
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
