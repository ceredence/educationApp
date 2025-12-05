import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomInput({
    super.key,
    required this.controller,
    this.label = '',
    this.hint,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label.isEmpty ? null : label,
        hintText: hint,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}