import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetailsViewAppbarWidget extends StatelessWidget {
  const DetailsViewAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: FaIcon(FontAwesomeIcons.x),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
    );
  }
}
