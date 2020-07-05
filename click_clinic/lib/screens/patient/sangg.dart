import 'package:click_clinic/services/Carte.dart';
import 'package:flutter/material.dart';

class DonDeSang extends StatefulWidget {
  @override
  _DonDeSangState createState() => _DonDeSangState();
}

class _DonDeSangState extends State<DonDeSang> {

  final GlobalKey<FireMapState> _key = new GlobalKey<FireMapState>();
  

  String dropdownValue = '  Choisissez le groupe sanguin';
  var sp = <String>[
    '  Choisissez le groupe sanguin',
    '  A+','  A-','  B+','  B-','  O+','  O-','  AB+','  AB-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
         Align(
          child: Carte(
            key: _key,
            Width: MediaQuery.of(context).size.width,
            Height: MediaQuery.of(context).size.height / 1.6,
          ),
          alignment: Alignment.bottomCenter,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.36, //apply everywhere
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.3,
                  0.7,
                  0.9
                ],
                colors: [
                  Color(0xFF00D0E1),
                  Color(0xFF00B3FA),
                  Color(0xFF00B9FF),
                ]),
            //color: Color(0xFF00B9FF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(77),
                bottomRight: Radius.circular(77)),
          ),
        ),
        Align(
              alignment: Alignment(0.75, -0.78),
                  child: SizedBox(
            /*child: Padding(
              padding: const EdgeInsets.only(top: 85, left: 260, right: 3),*/
              child: Text(
                "Bénévoles",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Poppins-Regular'),
              ),
            //),
          ),
        ),
        Align(
              alignment: Alignment(-0.8, -0.8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width /2.7,
            /*child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 210),*/
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 10,
                      child: Image.asset("assets/icones/retour.png"),
                      backgroundColor: Color(0xFF00B9FF),
                    ),
                    Text(
                      " Accueil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Poppins-Light'),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              //),
            ),
          ),
        ),
        Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.6
              ),
            SizedBox(
              child: Image.asset("assets/images/groupe-medecins.png", height:MediaQuery.of(context).size.height / 5.8 ),
            ),
            SizedBox(
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.search, color: Colors.white),
                      backgroundColor: Color(0xFF00B3FA),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              width: MediaQuery.of(context).size.width / 1.18, 
              height: 70,
            ),
          ]),
        ),
        Align(
          /*padding: EdgeInsets.only(top: 305, left: 90, right: 30),*/
          alignment: Alignment(0.34,-0.22),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
          child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 20,
              style: dropdownValue == sp[0]
                  ? TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      fontFamily: 'Poppins-Medium')
                  : TextStyle(
                      fontSize: 21,
                      color: Color(0xB3000000),
                      fontFamily: 'SegoeUI'),
              items: sp.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(newValue);
                });
                
                
                _key.currentState.rechSang(dropdownValue.replaceAll('  ', ''));
                
                
               }),
        ))
      ],

      ),
      
    );
  }
}