import 'package:click_clinic/screens/benevole/benevole.dart';
import 'package:click_clinic/screens/patient/drawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/screens/patient/principal.dart';
/*import 'package:click_clinic/switcher.dart';
import 'package:flutter/services.dart';*/

class Acceuil extends StatefulWidget {
  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {

  //when true shows this page , when false shows onboarding
  //purpose is to show onboarding only once
  bool toggle = true;
  
  //this variable is used to permanentally stay at patient/benevole page through Switcher(path: path)
  //not practical
  String path = '';

  @override
  Widget build(BuildContext context) {
    return /*toggle && path == ''
        ?*/
        Material(
      child: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          color: Color(0xFFDAE9EE),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 80),
                ),
                MyImage(),
                Padding(
                  padding: EdgeInsets.only(top: 14),
                ),
                Text(
                  "ClickClinic",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF00B9FF),
                      fontFamily: 'CenturyGothic-Bold'),
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset('assets/images/acceuil.png'),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Sélectionnez votre profil",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontFamily: 'Poppins-Regular'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Color(0xFF00B9FF),
                    onPressed: () {
                      /*setState(() {
                             toggle = false;
                             path = 'patient';
                            });*/
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PatientDrawer();
                        },
                      ));
                    },
                    child: Text(
                      "je suis un patient",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontFamily: 'Poppins-Regular'),
                    ),
                    shape: RoundedRectangleBorder(
                        //changed
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 290,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Color(0xFF00B9FF),
                    onPressed: () {
                      /*setState(() {
                              toggle = false;
                              path = 'benevole';
                            });*/
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Benevole();
                        },
                      ));
                    },
                    child: Text(
                      "je suis un bénevole",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontFamily: 'Poppins-Regular'),
                    ),
                    shape: RoundedRectangleBorder(
                        //changed
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 290,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 95),
                ),
                Text(''),
              ],
            ),
          ),
        ),
      ),
    )
        /*: Switcher(path: path)*/;
  }
}
//onPressed t3 patient / benevole has a setState that changes a str and passed it as an argument to switcher

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("assets/images/clickclinic.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
//not responsive
//redo the UI to make it responsive
