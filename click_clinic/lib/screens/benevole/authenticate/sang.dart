import 'package:flutter/material.dart';

import 'address.dart';
import 'inscription.dart';

class SangService extends StatefulWidget {
  Inscription user;
  SangService({this.user});

  @override
  _SangServiceState createState() => _SangServiceState(user: user);
}

class _SangServiceState extends State<SangService> {
  Inscription user;
  _SangServiceState({this.user});

  String dropdownValue = ' Groupe sanguin   ';
  var sp = <String>[' Groupe sanguin   ', ' A', ' B', ' O', ' AB'];

  String dropdownValue1 = ' Rhésus                  ';
  var sp1 = <String>[' Rhésus                  ', ' +', ' -'];

  String _bloodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
                color: Color(0xFFF4F8F9),
              ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: BoxDecoration(
              color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Align(
            alignment: Alignment(-0.95, -0.85),
            //return button
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height / 30,
                child: Image.asset("assets/icones/retour.png"),
                backgroundColor: Colors.white12,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Finalisez votre inscription',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Sélectionnez votre groupe sanguin et votre rhésus',
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: MediaQuery.of(context).size.height / 46, //change
                    color: Colors.white,
                  ),
                )),
          ),
          Align(
            alignment: Alignment(0, -0.2),
            //card for first DropDownMenu
            child: SizedBox(
              width: 300, //change
              height: 80, //change
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,//change
                        child: Icon(Icons.search, color: Colors.white),
                        backgroundColor: Color(0xFF00B3FA),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20, 
                        style: dropdownValue == sp[0]
                            ? TextStyle(
                                fontSize: 19,//change
                                color: Colors.grey[400],
                                fontFamily: 'Poppins-Regular')
                            : TextStyle(
                                fontSize: 21,//change
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
                            _bloodType = newValue;
                            print(newValue);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.05),
            //card for second DropDownMenu
            child: SizedBox(
              width: 300,
              height: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.search, color: Colors.white),
                        backgroundColor: Color(0xFF00B3FA),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue1,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20,
                        style: dropdownValue1 == sp1[0]
                            ? TextStyle(
                                fontSize: 19,
                                color: Colors.grey[400],
                                fontFamily: 'Poppins-Regular')
                            : TextStyle(
                                fontSize: 21,
                                color: Color(0xB3000000),
                                fontFamily: 'SegoeUI'),
                        items:
                            sp1.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue1 = newValue;
                            _bloodType += newValue;
                            print(newValue);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: SizedBox(
              width: 250,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  user.setBloodType(_bloodType.replaceAll(' ', ''));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SetAdresse(
                        user: user,
                      );
                    },
                  ));
                },
                child: Text("Suivant",
                style: TextStyle(
                            fontFamily: 'Poppins-Medium',
                            fontSize: 19,
                            color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      color: Color(0xFF00B9FF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
