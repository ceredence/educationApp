import 'package:dinacomapp/Components/custom_color.dart';
import 'package:flutter/material.dart';

class AdminTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AdminTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFEEF4F9),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xFFB4C3DE), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xFFB4C3DE), width: 2),
          ),

     suffixIcon: buttonText != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 6, top: 8, bottom: 8),
                  child: SizedBox(
                    height: 28, // 👈 tinggi button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.oubtnhomebiru,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 28), 
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: onButtonPressed,
                      child: Text(
                        buttonText!,
                        style: const TextStyle(
                          fontSize: 11, 
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : null,

        ),
      ),
    );
  }
}
