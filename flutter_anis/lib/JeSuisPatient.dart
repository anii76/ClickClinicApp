import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anis/Inscription.dart';


class JeSuisbevole extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JeSuisPatient();
  }
}

class _JeSuisPatient extends State<JeSuisbevole> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(


        child: Column(

          children: <Widget>[

            MyImageconnexion(),

            Padding(
              padding: EdgeInsets.only(top: 30),
            ),

            Text(
              "Heureux de vous revoir !",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  hintText: "Tapez votre e-mail",
                ),
              ),
              width: 350,
            ),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  hintText: "Tapez votre mot de passe",
                ),
              ),
              width: 350,
            ),
            Padding(
              padding: EdgeInsets.only(top: 35),
            ),
            SizedBox(

              child: OutlineButton(

                highlightedBorderColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                onPressed: () {},
                child: Text(
                  "Connexion",
                  style: TextStyle(fontSize: 18, color: Colors.lightBlue,),
                ),
                shape: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: 200,
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            FlatButton(
              child: Text(
                "Vous n'avez pas de compte ? INSCRIVEZ VOUS",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.lightBlue,
                ),
              ),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Inscription();
                },));
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
            ),
            Text(
              "Mot de passe oublié ?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImageconnexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("Assests/images/benevole.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}


