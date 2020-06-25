import 'package:click_clinic/screens/patient/imagerie.dart';
import 'package:click_clinic/screens/patient/labo.dart';
import 'package:click_clinic/screens/patient/opticiens.dart';
import 'package:click_clinic/screens/patient/parapharmacie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/screens/patient/principal.dart';

class Autre extends StatefulWidget {
  @override
  _AutreState createState() => _AutreState();
}

class _AutreState extends State<Autre> {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4F8F9),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 310.0,
              decoration: BoxDecoration(
                color: Color(0xFF00B9FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77)),
              ),
            ),

            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 85 ,left: 280, right: 10),
                child:
                      Text(
                        "Autres",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium'
                        ),
                      ),


                  ),
                ),

            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 70 ,left: 30, right: 210),
                child: RaisedButton(
                  color: Color(0xFF00B9FF),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Patient();
                    },));
                  },
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius:10,
                        child: Image.asset("assets/icones/retour.png"),
                        backgroundColor: Color(0xFF00B9FF),
                      ),
                      Text(
                        " Accueil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Poppins-Light'
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),

            ),
            Center(
              child: Column(
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(top: 175)),
                  Text(
                    'Cherchez-vous alors...',
                    style: TextStyle(fontSize: 28, color: Colors.white, fontFamily: 'Poppins-Medium'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Laboratoires();
                      },));
                      },
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset("assets/icones/labo.png"),
                            backgroundColor: Colors.red[100],
                          ),
                          Text(
                            "     Un laboratoire",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins-Regular'
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    width: 340,
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CentreImageries();
                      },));
                      },
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset("assets/icones/imagerie.png"),
                            backgroundColor: Colors.blueGrey[100],
                          ),
                          Text(
                            " Un centre d'imagerie",
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Poppins-Regular'
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    width: 340,
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Parapharmacies();
                      },));
                      },
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset("assets/icones/parapharmacie.png"),
                            backgroundColor: Colors.green[100],
                          ),
                          Text(
                            " Une parapharmacie",
                            style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Poppins-Regular'
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    width: 340,
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Opticiens();
                      },));
                      },
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset("assets/icones/opticien.png"),
                            backgroundColor: Colors.amber[100],
                          ),
                          Text(
                            "      Un opticien",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Poppins-Regular'
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    width: 340,
                    height: 80,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


