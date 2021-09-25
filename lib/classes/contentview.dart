import 'package:flutter/cupertino.dart';
import 'package:testportfolio/widgets/customtab.dart';

class Contentview {
  Contentview({required this.tab, required this.content, this.icona});

  final CustomTab tab;
  final Widget content;
  final Icon? icona;
}
