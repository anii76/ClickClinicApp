import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ParaDapp extends StatefulWidget {
  @override
  _ParaDappState createState() => _ParaDappState();
}

class _ParaDappState extends State<ParaDapp> {
  final List<String> para = <String>[
    "Langue",
    "Signaler un bug",
    "À propos",
    "License",
  ];
  final List<String> img = <String>[
    "net.png",
    "bug.png",
    "i.png",
    "license.png"
  ];
  final List<String> sub = <String>[
    "Changez la langue de\nl'application",
    "Rapportez une erreur\naux développeurs",
    "Détails de l'application\net sa license",
    "Informations sur la license\nde l'application",
  ];
  final List<String> textu = <String>[
    "Cette fonctionnalité n'est pas encore valable",
    "Contactez les développeurs",
    "Lien du projet ",
    "Cette application est dans le domaine public, ce qui veut dire qu'elle n'est protégée par aucun droit d'auteur."
  ];

  void contact() {
    String mailto =
        'mailto:a.bourouina@esi-sba.dz?subject=FeedBack&body:write your feed back';
    launch(mailto);
  }

  _launchURL() async {
    const url = 'https://gitHub.com/anii76/ClickClinicApp';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 28,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Color(0xFF00B9FF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(77),
                      bottomRight: Radius.circular(77)),
                ),
              ),
              Positioned(
                bottom: 25,
                right: 25,
                left: 25,
                top: -50,
                child: Align(
                  alignment: Alignment(-0.45, -0.45),
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
                            child: Image.asset("assets/images/Retour.png"),
                            backgroundColor: Color(0xFF00B9FF),
                          ),
                          Text(
                            "  Paramètres de l'application",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
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
              ),
              Center(
                child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 7),
                  SizedBox(
                    child: Image.asset(
                      "assets/images/OBJECTS.png",
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) => ExpansionTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    "assets/images/${img[index]}",
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  backgroundColor: Colors.white10,
                ),
                //initiallyExpanded: false,
                subtitle: Text(sub[index],
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Color(0x35000000),
                      fontSize: MediaQuery.of(context).size.height / 50,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                backgroundColor: Colors.white10,
                title: Text(para[index],
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      color: Color(0xff000000),
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                children: [
                  index == 0
                      ? Column(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.height / 8,
                              child: Card(
                                color: Colors.white,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textu[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Light',
                                        fontSize: MediaQuery.of(context).size.height / 47,
                                      ),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        )
                      : index == 1
                          ? Column(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  child: Card(
                                    color: Colors.white,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 70,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              textu[index],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins-Light',
                                                fontSize: MediaQuery.of(context).size.height / 47,
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                contact();
                                              },
                                              child: Text(
                                                'par e-mail',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins-Light',
                                                    fontSize: MediaQuery.of(context).size.height / 47,
                                                    color: Color(0xFF00B9FF),
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : index == 2
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Card(
                                        color: Colors.white,
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 65),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Image.asset(
                                                    "assets/images/l.png",
                                                    height: MediaQuery.of(context).size.height / 25,
                                                    ),
                                                RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Poppins-Light',
                                                          fontSize: MediaQuery.of(context).size.height / 47,
                                                          color: Colors.black),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Encadrement: ',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins-Light',
                                                              fontSize: MediaQuery.of(context).size.height / 47,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        TextSpan(
                                                            text:
                                                                '  Mme S.BENNABI\n'),
                                                        TextSpan(
                                                          text:
                                                              'Developeurs: ',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins-Light',
                                                              fontSize: MediaQuery.of(context).size.height / 47,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        TextSpan(
                                                            text:
                                                                '  A.BOUROUINA,  A.MOUSSOUNI,  S.CHERFAOUI,  R.HAMMA,  A.AMAZOUZ,  O.GHILES'),
                                                      ]),
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    _launchURL();
                                                  },
                                                  child: Text(
                                                    'Lien du projet',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins-Light',
                                                        fontSize: MediaQuery.of(context).size.height / 47,
                                                        color:
                                                            Color(0xFF00B9FF),
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: Card(
                                        color: Colors.white,
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 65,),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Image.asset(
                                                    "assets/images/pubdom.png",
                                                    height: MediaQuery.of(context).size.height / 20,
                                                    ),
                                                Text(
                                                  textu[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins-Light',
                                                    fontSize: MediaQuery.of(context).size.height / 47,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  //ListTile(),
                ]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.grey),
            itemCount: 4,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height / 45,),
            scrollDirection: Axis.vertical,
            //reverse: true,
            addAutomaticKeepAlives: true,
            cacheExtent: 100,

            // itemExtent: 90,
          ),
        ),
      ]),
    );
  }
}
