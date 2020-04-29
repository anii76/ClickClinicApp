import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anis/Finaliser.dart';


class Inscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Inscription();
  }
}

class _Inscription extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              MyImageinscription(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text(
                "Inscrivez-vous, c'est gratuit !",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    hintText: "Nom complet",
                  ),
                ),
                width: 350,
              ),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      size: 30,
                    ),
                    hintText: "Adresse e-mail",
                  ),
                ),
                width: 350,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        hintText: "Wilaya",
                      ),
                    ),
                    width: 120,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.local_phone,
                          size: 30,
                        ),
                        hintText: "Numéro de téléphone",
                      ),
                    ),
                    width: 200,
                  ),
                ],
              ),
              SizedBox(
                child: TextField(

                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                    hintText: "Mot de passe",
                  ),
                ),
                width: 350,
              ),

Padding(padding: EdgeInsets.only(top: 30,),),

              SizedBox(
                child: RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Finaliser();
                    },));
                  },
                  child: Text(
                    "Inscription",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                  shape: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: 200,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyImageinscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("Assests/images/inscription.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
