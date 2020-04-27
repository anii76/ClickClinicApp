import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'patient_1.dart';

class Medecin extends StatefulWidget {
  @override
  _MedecinState createState() => _MedecinState();
}

class _MedecinState extends State<Medecin> {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
          ),
          Container(
            width: 500.3,
            height: 350.0,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),

          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 85 ,left: 260, right: 3),
              child:
                    Text(
                      "Médecins",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 70 ,left: 30, right: 210),
              child: RaisedButton(
                color: Colors.lightBlueAccent[200],
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
                      backgroundColor: Colors.lightBlueAccent[200],
                    ),
                    Text(
                      " Accueil",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                shape: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

          ),
          Center(
            child: Column(
              children: <Widget>[

                Padding(padding: EdgeInsets.only(top: 145),
                    child: Image.asset("assets/images/groupe-medecins.png"),
                  ),

                Padding(
                  padding: EdgeInsets.only(),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
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
                          ),
                        ),
                      ],
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 300,
                  height: 80,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
