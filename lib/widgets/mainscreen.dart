import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testportfolio/classes/myprofile.dart';
import 'package:testportfolio/widgets/Reusablemobileappbar.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Reusablemobileappbar(
        appbarbackgroundcolor: Colors.blue,
        appbarheigth: 100,
        bottomleftradius: 50,
        bottomrightradius: 50,
        title: Text('Home'),
        leadingwidget: IconButton(
          icon: Icon(Icons.menu_outlined),
          onPressed: () => {ZoomDrawer.of(context)?.toggle()},
          iconSize: 30,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 50),
        children: [
          Column(
            children: [
              ClipOval(
                child: Material(
                  child: Ink.image(
                    image: AssetImage(
                        Myprofile.ilmioprofilo.assetimagepath!), //FileImage(

                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '${Myprofile.ilmioprofilo.name} ${Myprofile.ilmioprofilo.surname}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cloud Developer Student',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'Github',
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.github,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                tooltip: 'Instagram',
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                tooltip: 'Twitter',
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                tooltip: 'Reddit',
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.reddit,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
