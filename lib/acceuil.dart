import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'patient_1.dart';

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
              image: AssetImage("assets/images/doctor.png"),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Patient();
                    },));
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
                    print("");
                  },
                  child: Text("je suis un bénevole",style: TextStyle(fontSize: 19, color: Colors.white),),
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: 350,
                height:50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text("Montrez moi la différence",style: TextStyle(fontSize: 19, color: Colors.white),)
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
    AssetImage image = new AssetImage("assets/icones/logo.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}