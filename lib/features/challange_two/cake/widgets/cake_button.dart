import 'package:flutter/material.dart';

class CakeButton extends StatelessWidget {
  const CakeButton({super.key, required this.value});
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 1, color: Colors.white10),
      ),
      child: value,
    );
  }
}
