import 'package:flutter/material.dart';
import 'package:testportfolio/classes/myprofile.dart';

class Profileimage extends StatelessWidget {
  const Profileimage(
      {Key? key, required this.imageheigth, required this.imagewidth})
      : super(key: key);

  final double? imageheigth;
  final double? imagewidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      //heightFactor: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildimage(),
          Padding(
            padding: EdgeInsets.only(top: 24),
          ),
          buildinfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildinfo(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildimage() {
    return ClipOval(
      child: Material(
        child: Ink.image(
          image:
              AssetImage(Myprofile.ilmioprofilo.assetimagepath!), //FileImage(
          //File(Myprofile.ilmioprofilo.assetimagepath!),
          //),
          fit: BoxFit.cover,
          width: imagewidth,
          height: imageheigth,
        ),
      ),
    );
  }

  Widget buildinfo() {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Text(
          Myprofile.ilmioprofilo.username!,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          Myprofile.ilmioprofilo.aboutme!,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
