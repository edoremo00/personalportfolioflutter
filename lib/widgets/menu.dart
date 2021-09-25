import 'package:flutter/material.dart';
import 'package:testportfolio/classes/menumobileitems.dart';

class Menumobilesections {
  static const home = Menumobileitems(Icons.home, 'Home');
  static const aboutme = Menumobileitems(Icons.info_rounded, 'About me');
  static const projects = Menumobileitems(Icons.work, 'Projects');
  static const contacts = Menumobileitems(Icons.email, 'Contacts');

  static const all = <Menumobileitems>[home, aboutme, projects, contacts];
}

class Menu extends StatelessWidget {
  const Menu(
      {Key? key, required this.currentpage, required this.onselecteditem})
      : super(key: key);

  final Menumobileitems currentpage;
  final ValueChanged<Menumobileitems> onselecteditem;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(), //modifica colori testi e icone
      child: Scaffold(
        backgroundColor: Colors.indigo.shade700,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              ...Menumobilesections
                  .all //questi ... è detto spreadoperator. permette di inserire più elementi in una collection
                  .map(
                    (mobilemenuitems) => ListTileTheme(
                      selectedColor: Colors.white,
                      child: ListTile(
                        selected: currentpage == mobilemenuitems,
                        selectedTileColor: Colors.black26,
                        contentPadding: EdgeInsets.all(20),
                        leading: Icon(mobilemenuitems.icon),
                        title: Text(mobilemenuitems.title!),
                        minLeadingWidth: 20,
                        onTap: () => onselecteditem(mobilemenuitems),
                      ),
                    ),
                  )
                  .toList(),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
