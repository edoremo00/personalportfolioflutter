import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testportfolio/classes/myprofile.dart';
import 'package:testportfolio/widgets/profilewidget.dart';

class HomecontentPage extends StatelessWidget {
  const HomecontentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String twitterurl = 'https://twitter.com/EdoardoRemondi1';
    final String instagramurl = 'https://www.instagram.com/remons_00/';
    final String githuburl = 'https://github.com/edoremo00';
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Profileimage(
                          imageheigth: 200,
                          imagewidth: 200,
                        ).buildimage(),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 200,
                          width: 450,
                          child: Text(
                            'Ciao!!!, Benvenuto sul mio sito.    Mi chiamo ${Myprofile.ilmioprofilo.name} e attualmente studio metodi e Tecniche per lo sviluppo Cloud',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'FOLLOW ME ON',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'Instagram',
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          tooltip: 'Twitter',
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          tooltip: 'GitHub',
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          tooltip: 'Reddit',
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.reddit,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
