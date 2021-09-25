import 'package:flutter/material.dart';

class Reusablemobileappbar extends StatelessWidget
    implements PreferredSizeWidget {
  const Reusablemobileappbar(
      {Key? key,
      this.leadingwidget,
      this.title,
      this.appbarheigth,
      this.actions,
      this.bottomleftradius,
      this.bottomrightradius,
      this.appbarbackgroundcolor})
      : super(key: key);
  final Widget? leadingwidget;
  final Widget? title;
  final double? appbarheigth;
  final List<Widget>? actions;
  final double? bottomleftradius;
  final double? bottomrightradius;
  final Color? appbarbackgroundcolor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomleftradius!),
            bottomRight: Radius.circular(bottomrightradius!),
          ),
        ),
        toolbarHeight: appbarheigth,
        backgroundColor: appbarbackgroundcolor,
        title: title,
        leading: leadingwidget);
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
