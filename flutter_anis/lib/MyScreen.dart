import 'package:flutter/cupertino.dart';
import 'package:flutter_anis/JeSuisPatient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anis/p_vs_b.dart';


class MyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyScreen();
  }
}

class _MyScreen extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assests/images/doctor.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60),
              ),
              MyImage(),
              Padding(
                padding: EdgeInsets.only(top: 14),
              ),
              Text(
                "APPNAME",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 220),
              ),
              Text(
                "Bienvenue, sélectionnez votre ",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              Text(
                "profil pour continuer ",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              SizedBox(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {

                  },
                  child: Text("je suis un patient",style: TextStyle(fontSize: 19, color: Colors.white),),
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: 350,height: 50,),

              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              SizedBox(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return JeSuisbevole();
                    },));
                  },
                  child: Text("je suis un bénevole",style: TextStyle(fontSize: 19, color: Colors.white),),
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: 350,
                height:50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              FlatButton(
                child: Text("Montrez moi la différence",style: TextStyle(fontSize: 16, color: Colors.white),),
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return P_vs_b();
                  },));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("Assests/images/logo.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
