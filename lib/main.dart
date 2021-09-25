import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:testportfolio/classes/contentview.dart';
import 'package:testportfolio/classes/menumobileitems.dart';
import 'package:testportfolio/widgets/Aboutmemobilepage.dart';
import 'package:testportfolio/widgets/contactsmobilepage.dart';
import 'package:testportfolio/widgets/customtab.dart';
import 'package:testportfolio/widgets/customtabbar.dart';
import 'package:testportfolio/widgets/homecontentpage.dart';
import 'package:testportfolio/widgets/mainscreen.dart';
import 'package:testportfolio/widgets/menu.dart';
import 'package:testportfolio/widgets/profilewidget.dart';
import 'package:testportfolio/widgets/projectsmobilepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'mainscreen': (context) => Mainscreen(),
        'aboutmemobile': (context) => Aboutmemobilepage()
      },
      title: 'Personal Website',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //mi salvo in questa variabile la pagina corrente del menu
  Menumobileitems currentpage = Menumobilesections.home;

  var opendrawerkey = GlobalKey<ScaffoldState>();
  late TabController controller;
  late double screenHeigth;
  late double toppadding;
  late double bottompadding;
  late double screenwidth;
  static List<Contentview> contenuto = [
    Contentview(
      tab: CustomTab(
        title: 'Home',
        icona: Icon(Icons.home_outlined),
      ),
      content: HomecontentPage(),
    ),
    Contentview(
      tab: CustomTab(
        title: 'About me',
        icona: Icon(Icons.info),
      ),
      content: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Profileimage(
              imageheigth: 128,
              imagewidth: 128,
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
    Contentview(
      tab: CustomTab(
        title: 'Projects',
        icona: Icon(Icons.work_rounded),
      ),
      content: Center(
        child: Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
      ),
    ),
    Contentview(
      tab: CustomTab(
        title: 'Contacts',
        icona: Icon(Icons.contact_mail),
      ),
      content: Center(
        child: Container(
          color: Colors.blue,
          width: 100,
          height: 100,
        ),
      ),
    )
  ];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: contenuto.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenHeigth = MediaQuery.of(context).size.height;
    toppadding = screenHeigth * 0.05;
    bottompadding = screenHeigth * 0.01;
    return Scaffold(
      key: opendrawerkey,
      backgroundColor: Colors.black,
      drawer: mobileview(),
      //endDrawer: drawer(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) {
            return desktopview();
          } else {
            return mobileview();
          }
        },
      ),
    );
  }

  Widget desktopview() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTabbar(
          controller: controller,
          tabs: contenuto.map((e) => e.tab).toList(),
        ),
        Container(
          height: screenHeigth * 0.85,
          child: TabBarView(
            controller: controller,
            children: contenuto.map((e) => e.content).toList(),
          ),
        ),
      ],
    );
  }

  Widget mobileview() {
    return ZoomDrawer(
      borderRadius: 40,
      style: DrawerStyle.Style1,
      menuScreen: Builder(
        builder: (context) => Menu(
          currentpage: currentpage,
          onselecteditem: (Menumobileitems value) {
            setState(() {
              currentpage = value;

              ZoomDrawer.of(context)!.close();
            });
          },
        ),
      ),
      mainScreen: navigatetoselectedscreen(),
    );
  }

  Widget navigatetoselectedscreen() {
    switch (currentpage) {
      case Menumobilesections.aboutme:
        return Aboutmemobilepage();
      case Menumobilesections.contacts:
        return Contactsmobilepage();
      case Menumobilesections.projects:
        return Projectsmobilepage();
      case Menumobilesections.home:
        return Mainscreen();
      default:
        return Mainscreen();
    }
  }
}
