import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final int? height;
  final int? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
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
        height: widget.height?.toDouble() ?? 86,
        width: widget.width?.toDouble(),
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
                  borderRadius: BorderRadius.circular(18),
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
                  color: const Color(0xFFCDE3F8),
                  borderRadius: BorderRadius.circular(18),
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

  // warna-warna
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final Color shadowColor;

  const ButtonHome({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.level,
    this.backgroundColor = const Color(0xFFFFD6F5),
    this.borderColor = const Color(0xFFE68ACB),
    this.iconColor = const Color(0xFF2C3E50),
    this.textColor = Colors.black,
    this.shadowColor = const Color(0xFFE68ACB),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.6),
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 40,
                color: iconColor,
              ),

            if (level != null) ...[
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  level!,
                  (index) => Icon(
                    Icons.star_rounded,
                    size: 18,
                    color: iconColor,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
