import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.labelText,
    this.validator,
    this.onSaved,
    this.maxLines,
    super.key,
  });

  final int? maxLines;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        labelText: labelText,
      ),
      validator: validator,
      onSaved: onSaved,
      maxLines: maxLines,
    );
  }
}
