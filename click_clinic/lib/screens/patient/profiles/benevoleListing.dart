import 'package:click_clinic/screens/patient/profiles/benevoleDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BenevoleListing extends StatefulWidget {
  String service;
  BenevoleListing({@required this.service});

  @override
  _BenevoleListingState createState() =>
      _BenevoleListingState(service: service);
}

class _BenevoleListingState extends State<BenevoleListing> {
  String service;
  _BenevoleListingState({this.service});

  bool loading = false;
  Firestore firestore = Firestore.instance;
  List benevoles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF4F8F9), //background
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.6,
            decoration: BoxDecoration(
              color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.585),
            child: Image.asset(
              "assets/images/old.png",
              height: MediaQuery.of(context).size.height / 4.5,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.87),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height / 15,
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 10, //change
                      child: Image.asset("assets/icones/retour.png"),
                      backgroundColor: Color(0xFF00B9FF),
                    ),
                    Text(
                      "Bénévoles                                        ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 45,
                          fontFamily: 'Poppins-Light',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.10),
            child: Text(
              'Appuyez sur un bénévole \npour afficher son profil ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                fontSize: MediaQuery.of(context).size.height / 50,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.1),
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              child: StreamBuilder<Object>(
                  stream: firestore
                      .collection('Benevole')
                      .where("$service", isEqualTo: true)
                      .where("Disponibilite", isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      benevoles = [''];
                      benevoles.clear();
                      QuerySnapshot values = snapshot.data;
                      var documentList = values.documents;
                      documentList.forEach((DocumentSnapshot document) {
                        print(document.data);
                        benevoles.add(document);
                      });
                      print(benevoles);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: benevoles.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 70,
                                horizontal:
                                    MediaQuery.of(context).size.width / 8.5,
                              ),
                              child: UI(benevoles[index]),
                            );
                          });
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ),
          /*Align(
            alignment: Alignment(0, 0.1),
            child: benevoles == null
                ? Text(
                    'pas de resultas :(', 
                  )
                : Text(
                    '',
                  ),
          )*/
        ],
      ),
    );
  }

  rechBenevole(String service) {
    setState(() {
      loading = true;
    });
    _startquery(service);
  }

  _startquery(String service) {
    var ref = firestore
        .collection('Benevole')
        .where("$service", isEqualTo: true)
        .where("Disponibilite", isEqualTo: true)
        .getDocuments()
        .then((snapshot) {
      _updateData(snapshot.documents);
      loading = false;
      print('here');
    });
    setState(() {
      loading = false;
      print(loading);
    });
  }

  _updateData(List<DocumentSnapshot> documentList) {
    print(documentList);
    if (benevoles != null) {
      benevoles.clear();
    } else {
      benevoles = [''];
      benevoles.clear();
    }
    documentList.forEach((DocumentSnapshot document) {
      print(document.data);
      benevoles.add(document);
    });
    print(benevoles);
  }

  Widget UI(DocumentSnapshot document) {
    var imgUrl = document.data["ProfilePicPath"];
    var nom = document.data["Nom"];
    var adr = document.data["Adress"];
    return SizedBox(
      height: MediaQuery.of(context).size.height / 11,
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BenevoleDetails(collection: document);
            },
          ));
        },
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: MediaQuery.of(context).size.height / 30,
              child: ClipOval(
                child: imgUrl != null && imgUrl != ''
                    ? Image.network(imgUrl)
                    : Image.asset("assets/images/man.png"),
              ),
              backgroundColor: Colors.white10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 12,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                nom,
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: MediaQuery.of(context).size.height / 50,
                ),
              ),
              Text(
                adr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: MediaQuery.of(context).size.height / 60,
                ),
              ),
            ]),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
