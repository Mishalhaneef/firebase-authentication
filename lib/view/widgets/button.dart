import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.child,
    this.borderColor = Colors.transparent,
    this.backgroundColor,
    this.onTap,
  });

  final Widget child;
  final Color borderColor;
  final Color? backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          width: 200,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
