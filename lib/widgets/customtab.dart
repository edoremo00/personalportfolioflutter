import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title, this.icona})
      : super(key: key);

  final String title;
  final Icon? icona;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: icona,
      text: title,
    );
  }
}
