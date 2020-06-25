import 'package:click_clinic/services/Carte.dart';
import 'package:flutter/material.dart';


class Medecins extends StatefulWidget {
  @override
  _MedecinsState createState() => _MedecinsState();
}

class _MedecinsState extends State<Medecins> {

final GlobalKey<FireMapState> _key = new GlobalKey<FireMapState>();
  

  String dropdownValue = '  Choisissez la spécialité';
  var sp = <String>[
    '  Choisissez la spécialité',
    '  Acupuncture','  Allergologue','  Anatomie et cytologie pathologique',
    '  Cardiologue','  Chirurgien Cardiaque',
    '  Chirurgien dentiste','  Chirurgien général','  Chirurgien Maxillo-facial',
    '  Chirurgien Plastique','  Chirurgien Urologue','  Chirurgien vasculaire',
    '  Dermatologue','  Diabétologue','  Endodontiste','  Epidemiologiste',
    '  Gastrologue','  Gynécologue','  Histologiste','  Implantologiste',
    '  Médecin biologiste','  Médecin du sport','  Médecin du travail',
    '  Médecin généraliste','  Médecin Infectiologue','  Médecin interniste','  Médecin légiste',
    '  Médecin Radiologue','  Médecin réanimateur','  Médecin rééducateur','  Microbiologiste',
    '  Nephrologue','  Neurologue','  Occlusodontiste','  Oncologue',
    '  Ophtalmologue','  ORL','  Orthopédiste','  Pardontologiste','  Pediatre',
    '  Pédodontiste','  Pneumo-Phtisiologue','  Psychiatre','  Radiologue',
    '  Radiothérapeute','  Radiothérapeute oncologue','  Rhumatologue','  Toxicologue','  Urologue',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
         Align(
          child: Carte(
            key: _key,
            Width: MediaQuery.of(context).size.width,
            Height: MediaQuery.of(context).size.height / 1.5,
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
                "Médecins",
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
                      fontSize: 19,
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
                
                
                _key.currentState.method(dropdownValue.replaceAll('  ', ''));
                
                
                print(dropdownValue.replaceFirst(new RegExp(r' '), ''));
               }),
        ))
      ],

      ),
    bottomSheet: Container(
              height: 55.0,
              width: double.infinity,
              color: Colors.white,
              child: Center(child: Text(
                'Besoin d\'un logement pendant votre séjour médical ?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF00B3FA),
                  fontFamily: 'SegoeUI',
                ),
              ),),
      )
    );
  }

}

