import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool isNumber;
  final Color? borderColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final double? width; // Tambahan untuk kontrol lebar opsional

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.isNumber = false,
    this.borderColor,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.width, // bisa diatur dari luar
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // kasih batas lebar pasti
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
