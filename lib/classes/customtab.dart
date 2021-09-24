import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title, this.icona, this.ontap})
      : super(key: key);

  final String title;
  final Icon? icona;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, wordSpacing: 0),
      ),
    );
  }
}
