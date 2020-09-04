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

  /*@override
  void initState() {
    rechBenevole(service);
    super.initState();
  }*/

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
            alignment: Alignment(0, -0.8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.12,
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
                      "      Bénévoles",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Poppins-Light'),
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
            alignment: Alignment(0, -0.19),
            child: Text('Appuyez sur un bénévole \npour afficher son profil '),
          ),
          Align(
            alignment: Alignment(0, 0.22),
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
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
                            child: UI(benevoles[index]),
                          );
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else
                    return Text('No results');
                }),
          ),
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
    var tel = document.data["Tel"];
    return SizedBox(
      width: 500, //not working
      height: 60,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BenevoleDetails(collection: document);
            },
          ));
        },
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 22,
              child: ClipOval(
                              child: imgUrl != null
                    ? Image.network(imgUrl)
                    : Image.asset("assets/images/man.png"),
              ),
              backgroundColor: Colors.white10,
            ),
            SizedBox(width:  30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(nom),
              Text(tel),
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
