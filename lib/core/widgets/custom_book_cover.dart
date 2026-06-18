import 'package:bookly_clean_arch/core/utils/assets.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomBookCoverWidget extends StatelessWidget {
  const CustomBookCoverWidget({super.key, required this.img});

  final String? img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(24),
      child: FancyShimmerImage(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.height / 4,
        imageUrl: img ?? "",
        errorWidget: Image.asset(
          Assets.imagesCover, // safest option
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
