import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/details/presentation/cubit/cubit/get_similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/details_view_appbar.dart';
import 'widgets/book_details_widget.dart';
import 'widgets/you_can_also_like_section.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: DetailsViewBody(book: book));
  }
}

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {

  @override
  void initState() {
    super.initState();
    context.read<SimilarBooksCubit>().getSimilarBooks(widget.book.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 14),
          DetailsViewAppbarWidget(),
          SizedBox(height: 28),
          BookDetailsWidget(book: widget.book),
          SizedBox(height: 20),
          YouCanAlsoLikeSection(),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
