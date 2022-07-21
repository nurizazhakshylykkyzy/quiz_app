import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.text, this.color, this.onPressed});
  final String text;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color ?? Colors.yellow, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
            // horizontal: 50,
            horizontal: MediaQuery.of(context).size.width * 0.3,
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
