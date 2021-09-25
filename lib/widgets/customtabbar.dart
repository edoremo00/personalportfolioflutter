import 'package:flutter/material.dart';

//è classe usata per creare menu stile desktop
class CustomTabbar extends StatelessWidget {
  const CustomTabbar({Key? key, required this.controller, required this.tabs})
      : super(key: key);

  final TabController controller;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double tabbarscaling = screenwidth > 1400
        ? 0.22
        : screenwidth > 1100
            ? 0.3
            : 0.6;
    return Container(
      width: screenwidth * tabbarscaling * 2,
      child: Theme(
        data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        child: TabBar(
          controller: controller,
          automaticIndicatorColorAdjustment: true,
          tabs: tabs,
        ),
      ),
    );
  }
}
