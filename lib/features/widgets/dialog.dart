import 'package:flutter/material.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/theme/colors.dart';

enum AppDialogPressed { cancel, ok }

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.content,
    this.actions,
    this.title,
    super.key,
  });
  factory AppDialog.alert({
    required String okLabel,
    void Function(AppDialogPressed state)? onPressed,
    String? cancelLabel,
    Widget? title,
    Widget? content,
  }) =>
      AppDialog(
        title: title,
        content: content,
        actions: <Widget>[
          if (cancelLabel != null)
            _DialogActionButton(
              pressAction: AppDialogPressed.cancel,
              label: cancelLabel,
              onPressed: onPressed,
            ),
          const SizedBox(width: Spacing.s4),
          _DialogActionButton(
            pressAction: AppDialogPressed.ok,
            label: okLabel,
            onPressed: onPressed,
          ),
        ],
      );

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  static Future<dynamic> showAlert(
    BuildContext context, {
    required String okLabel,
    void Function(AppDialogPressed state)? onPressed,
    String? cancelLabel,
    Widget? title,
    Widget? content,
  }) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => AppDialog.alert(
          title: title,
          content: content,
          cancelLabel: cancelLabel,
          okLabel: okLabel,
          onPressed: onPressed,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPalettes.neutral[100],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Spacing.s2)),
      ),
      buttonPadding:
          const EdgeInsets.only(right: Spacing.s4, bottom: Spacing.s4),
      insetPadding: const EdgeInsets.symmetric(horizontal: Spacing.s4),
      titlePadding: const EdgeInsets.fromLTRB(
        Spacing.s4,
        Spacing.s4,
        Spacing.s4,
        Spacing.zero,
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        Spacing.s4,
        Spacing.s1,
        Spacing.s4,
        Spacing.s1,
      ),
      title: title,
      content: content,
      actions: actions,
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  const _DialogActionButton({
    required this.label,
    required this.pressAction,
    this.onPressed,
  });

  final AppDialogPressed pressAction;
  final String label;
  final ValueChanged<AppDialogPressed>? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      foregroundColor: ColorPalettes.pink[50],
      padding: const EdgeInsets.symmetric(horizontal: Spacing.s2),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
    return TextButton(
      style: style,
      child: Text(
        label,
        style: TextStyle(color: ColorPalettes.neutral[800]),
      ),
      onPressed: () {
        Navigator.maybePop(context);
        if (onPressed != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onPressed?.call(pressAction);
          });
        }
      },
    );
  }
}
