import 'package:flutter/material.dart';
import 'package:testportfolio/classes/contentview.dart';
import 'package:testportfolio/classes/customtab.dart';
import 'package:testportfolio/classes/customtabbar.dart';
import 'package:testportfolio/classes/homecontentpage.dart';
import 'package:testportfolio/profilewidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edoardo Remondini',
      //color: Colors.blue,
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var opendrawerkey = GlobalKey<ScaffoldState>();
  late TabController controller;
  late double screenHeigth;
  late double toppadding;
  late double bottompadding;
  late double screenwidth;
  List<Contentview> contenuto = [
    Contentview(
      tab: CustomTab(
          title: 'Home',
          icona: Icon(Icons.home_outlined),
          ontap: () => {print('cliccato Home')}),
      content: HomecontentPage(),
    ),
    Contentview(
      tab: CustomTab(
        title: 'About me',
        icona: Icon(Icons.info),
        ontap: () => {print('cliccato About me')},
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
        ontap: () => {print('cliccato projects')},
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
          ontap: () => {print('cliccato contacts')}),
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
      endDrawer: drawer(),
      //endDrawer: Drawer(),
      //appBar: AppBar(
      //actions: [
      /*TextButton(
            onPressed: () {},
            child: Text('About'),
          ),*/
      //Text('About'),
      /*SizedBox(
            width: 20,
          ),*/
      //Text('Projects'),
      /*SizedBox(
            width: 20,
          ),
          Text('Contacts'),*/
      //],
      //leading: Icon(Icons.android),
      /*title: Icon(
            Icons.bug_report,
            size: 80,
          ),
          toolbarHeight: 80,
          backgroundColor: Colors.blue,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
        ),*/
      body: //Padding(
          //padding: EdgeInsets.only(top: toppadding, bottom: bottompadding),
          //child:
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 700) {
          return desktopview();
        } else {
          return mobileview();
        }
        /*Center(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Profileimage(),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),*/
      }),
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
    return Padding(
      padding:
          EdgeInsets.only(left: screenwidth * 0.05, right: screenwidth * 0.05),
      child: Container(
        color: Colors.black,
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              iconSize: screenwidth * 0.08,
              onPressed: () => opendrawerkey.currentState!.openEndDrawer(),
              icon: Icon(Icons.menu_rounded, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
              Container(
                height: screenHeigth * 0.1,
              )
            ] +
            contenuto
                .map(
                  (e) => Container(
                    padding: EdgeInsets.only(top: 24, bottom: 24),
                    child: ListTile(
                      leading: e.tab.icona,
                      title: Text(e.tab.title),
                      onTap: e.tab.ontap,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
