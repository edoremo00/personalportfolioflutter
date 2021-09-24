import 'package:flutter/material.dart';
import 'package:testportfolio/classes/myprofile.dart';
import 'package:testportfolio/profilewidget.dart';

class HomecontentPage extends StatelessWidget {
  const HomecontentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 100, top: 100),
              child: Profileimage(
                imageheigth: 256,
                imagewidth: 256,
              ).buildimage(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100, right: 60),
              child: Column(
                children: [
                  Text(
                    Myprofile.ilmioprofilo.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    Myprofile.ilmioprofilo.surname!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Cloud Developer Student',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
