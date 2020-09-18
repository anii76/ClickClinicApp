import 'package:click_clinic/screens/benevole/benevole.dart';
import 'package:click_clinic/screens/patient/drawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  //when true shows this page , when false shows onboarding
  //purpose is to show onboarding only once
  bool toggle = true;
  String path = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFDAE9EE),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.82),
            child: MyImage(),
          ),
          Align(
            alignment: Alignment(0, -0.6),
            child: Text(
              "ClickClinic",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Color(0xFF00B9FF),
                  fontFamily: 'CenturyGothic-Bold'),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.15),
            child: Image.asset(
              'assets/images/acceuil.png',
              height: MediaQuery.of(context).size.height / 2.8,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.3),
            child: Text(
              "Sélectionnez votre profil",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  color: Colors.black,
                  fontFamily: 'Poppins-Regular'),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.55),
            child: SizedBox(
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PatientDrawer();
                    },
                  ));
                },
                child: Text(
                  "je suis un patient",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      color: Colors.white,
                      fontFamily: 'Poppins-Regular'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.39,
              height: MediaQuery.of(context).size.height / 16,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.71),
            child: SizedBox(
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Benevole();
                    },
                  ));
                },
                child: Text(
                  "je suis un bénevole",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                      color: Colors.white,
                      fontFamily: 'Poppins-Regular'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.39,
              height: MediaQuery.of(context).size.height / 16,
            ),
          ),
        ],
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = new AssetImage("assets/images/clickclinic.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
      height: MediaQuery.of(context).size.height / 10,
    );
  }
}

