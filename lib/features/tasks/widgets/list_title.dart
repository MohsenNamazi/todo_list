import 'package:flutter/material.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/theme/colors.dart';

class ListTitle extends StatelessWidget {
  const ListTitle(this.title, {super.key, this.topPadding = 0});
  final String title;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.s4).copyWith(
        top: topPadding,
      ),
      child: Text(
        title,
        style: TextStyle(color: ColorPalettes.pink[500]),
      ),
    );
  }
}
