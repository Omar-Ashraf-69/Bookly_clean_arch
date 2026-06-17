import 'package:bookly_clean_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewCustomAppbarWidget extends StatelessWidget {
  const SearchViewCustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.arrowLeft),
          SizedBox(width: 12),
          Text("Go Back", style: AppStyles.montserratMedium16),
        ],
      ),
    );
  }
}
