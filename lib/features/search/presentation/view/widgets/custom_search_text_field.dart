import 'package:bookly_clean_arch/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().searchText,
      onChanged: (value) {
        context.read<SearchCubit>().searchBooks();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        hintText: "Search",
        suffixIcon: Padding(
          padding: EdgeInsetsGeometry.only(right: 12),
          child: IconButton(
            onPressed: () {
              context.read<SearchCubit>().searchBooks();
            },
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
        ),
      ),
    );
  }
}
