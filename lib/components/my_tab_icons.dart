import 'package:flutter/material.dart';

class MyTabIcons extends StatelessWidget {
  final IconData icon;
  final String textContext;

  MyTabIcons({required this.icon, required this.textContext});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
      text: textContext, // 문자열을 바로 넣어줍니다.
    );
  }
}
