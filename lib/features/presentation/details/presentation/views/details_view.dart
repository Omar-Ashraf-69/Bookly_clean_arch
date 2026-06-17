import 'widgets/details_view_appbar.dart';
import 'widgets/book_details_widget.dart';
import 'widgets/you_can_also_like_section.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DetailsViewBody());
  }
}

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 14),
          DetailsViewAppbarWidget(),
          SizedBox(height: 28),
          BookDetailsWidget(),
          SizedBox(height: 20),
          YouCanAlsoLikeSection(),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
