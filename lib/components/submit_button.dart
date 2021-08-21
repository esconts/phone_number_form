import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({this.color, this.onPressed});
  final Color? color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_right_alt,
        size: 62,
        color: color,
      ),
      onPressed: onPressed,
    );
  }
}
