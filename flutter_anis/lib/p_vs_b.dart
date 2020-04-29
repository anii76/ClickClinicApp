import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P_vs_b extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _P_vs_b();
  }
}

class _P_vs_b extends State<P_vs_b> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 60)),
              Patient(),
              Padding(
                padding: EdgeInsets.only(top: 75),
              ),
              Text(
                "Vous étes un patient",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                "Si vous souhaitez trouver les médecins",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                "les plus proches de vous ou",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Text(
                "demander de l'aide à des bénevole.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 290),
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        /* Navigator.push(context, MaterialPageRoute(builder: (context){
                        return JeSuisbevole();
                      },));*/
                      },
                      child: Text(
                        "Suivant",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      shape: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    width: 100,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Patient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image = new AssetImage("Assests/images/annnis.png");
    Image myimg = new Image(image: image);
    return Container(
      child: myimg,
    );
  }
}
