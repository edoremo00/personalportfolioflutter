import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testportfolio/widgets/Reusablemobileappbar.dart';

class Aboutmemobilepage extends StatelessWidget {
  Aboutmemobilepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        //wrappo tutto con on willpop scope perchè non voglio far chiudere l'app se l'utente usa il back di android e non dell'appbar
        child: Scaffold(
          appBar: Reusablemobileappbar(
            title: Text('About me'),
            appbarheigth: 80,
            appbarbackgroundcolor: Colors.blue,
            bottomleftradius: 50,
            bottomrightradius: 50,
            leadingwidget: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () => {ZoomDrawer.of(context)!.toggle()},
              iconSize: 30,
            ),
          ),
          body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: buildprofileimage(),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                ),
                onPressed: () {},
                child: Text(
                  'Need more info? Contact me',
                ),
              ),
              ListTile(
                title: Text('Edoardo Remondini'),
                subtitle: Text('Cloud Developer Student'),
                leading: Icon(
                  FontAwesomeIcons.cloud,
                  color: Colors.blue.shade100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey.shade700,
                indent: 40,
                endIndent: 40,
              ),
              ListTile(
                title: Text('Date of birth'),
                subtitle: Text('28/12/2000'),
                leading: Icon(
                  FontAwesomeIcons.birthdayCake,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey.shade700,
                indent: 40,
                endIndent: 40,
              ),
              ListTile(
                title: Text(
                  'About',
                ),
                subtitle: Text(
                    "Hi everyone,I'm a Cloud Developer Student at ITSincom. I'm 20 years old and started my journey in the IT world in 2020.All my knowledge comes from the course I'm attending in Busto Arsizio in Italy and through tutorials and examples found on the web"),
                leading: Icon(
                  FontAwesomeIcons.info,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey.shade700,
                indent: 40,
                endIndent: 40,
              ),
              ListTile(
                title: Text(
                  'Technologies I know',
                ),
                subtitle: Container(
                  child: Column(
                    children: [
                      Text(
                          '- C#,-HTML5,-CSS3,-ANGULAR,-GIT,-DOCKER,-KUBERNETES BASICS,-TYPESCRIPT BASICS,-SQL BASICS'),
                    ],
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.code,
                  color: Colors.black,
                ),
              ),
              Divider(
                color: Colors.grey.shade700,
                indent: 40,
                endIndent: 40,
              ),
            ],
          ),
        ),
        onWillPop: () {
          ZoomDrawer.of(context)!.open();
          return Future.value(false);
        });
  }

  Widget buildprofileimage() => CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        backgroundImage: AssetImage('android/assets/minecraftcharacter.png'),
        radius: 60,
      );
}

/*CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('android/assets/developer.png',
                      fit: BoxFit.cover),
                ),

                /*actions: [
                  IconButton(
                    icon: Icon(Icons.menu_outlined),
                    onPressed: () => {ZoomDrawer.of(context)!.toggle()},
                    iconSize: 30,
                  ),
                ],*/
                expandedHeight: 200,
                title: Text('About me'),
                leading: IconButton(
                  onPressed: () => {
                    if (Navigator.of(context).canPop() == true)
                      {Navigator.of(context).pop()},
                    ZoomDrawer.of(context)!.open(),
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildprofileimage(),
                    ],
                  ),
                ]),
              ),
            ],
          ),*/
