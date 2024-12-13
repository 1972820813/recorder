import 'package:flutter/material.dart';

class ClickText extends StatelessWidget {
  String title;
  Color color;
  VoidCallback onTop;

  ClickText(
      {super.key,
      required this.title,
      required this.color,
      required this.onTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTop,
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 14),
        ),
      ),
    );
  }
}
