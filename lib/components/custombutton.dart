import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Color? backgroundcolor;
  final Color? textcolor;
  final Color? borderColor; // New parameter for border color

  const CustomLoginButton({
    Key? key,
    required this.onPressed,
    this.backgroundcolor,
    this.text,
    this.textcolor,
    this.borderColor, // Initialize border color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text!,
          style: TextStyle(fontSize: 16, color: textcolor),
        ),
      ),
    );
  }
}
