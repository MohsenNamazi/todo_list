import 'package:flutter/material.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/widgets/dialog.dart';

abstract class TextFieldDialog {
  static void show(
    BuildContext context, {
    required String okLabel,
    required String title,
    required TextEditingController controller,
    required Function(AppDialogPressed) onPressed,
    String? cancelLabel,
  }) {
    AppDialog.showAlert(
      context,
      okLabel: okLabel,
      onPressed: onPressed,
      cancelLabel: cancelLabel,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Spacing.s4),
          Text(title),
          TextField(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
