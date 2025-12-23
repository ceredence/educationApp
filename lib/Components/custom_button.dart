import 'package:dinacomapp/Components/custom_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTap: () {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: SizedBox(
        height: 86,
        width: double.infinity,
        child: Stack(
          children: [
           
            Positioned(
              top: _isPressed ? 12 : 8,
              left: 0,
              right: 0,
              child: Container(
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF9EC6E8),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              top: _isPressed ? 12 : 0,
              left: 0,
              right: 0,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFB9DBFB),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: const Color(0xFF9EC6E8),
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonHome extends StatelessWidget {
  final IconData? icon;
  final int? level;
  final String title;
  final VoidCallback onPressed;

  const ButtonHome({super.key, required this.onPressed, this.icon, required this.title, this.level});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: CustomColor.button,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: CustomColor.tekscolor,
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColor.tekscolor,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, size: 36, color: CustomColor.greyawan,),
            
            if (level != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  level!,
                  (index) => const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),

            const SizedBox(height: 8,),

            Text(title, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),)
          ],
        ),
      ),
    );
  }
}