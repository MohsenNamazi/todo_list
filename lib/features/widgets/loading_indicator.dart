import 'package:flutter/material.dart';
import 'package:todo_list/features/common/consts/spacing.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: Spacing.s15,
          width: Spacing.s15,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
