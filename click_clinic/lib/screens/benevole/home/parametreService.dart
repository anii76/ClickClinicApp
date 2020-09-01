import 'package:click_clinic/models/user.dart';
import 'package:click_clinic/services/database.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum BloodType {A, B, O, AB}
enum Rhesus {plus , minus}

class ParaDesServices extends StatefulWidget {
  @override
  _ParaDesServicesState createState() => _ParaDesServicesState();
}

class _ParaDesServicesState extends State<ParaDesServices> {
  final List<String> para = <String>[
    "Services proposés",
    "Mon adresse",
    "Groupe sanguin",
  ];
  final List<String> img = <String>[
    "a.png",
    "homy.png",
    "sang_.png",
  ];
  final List<String> sub = <String>[
    "Modifiez les services que\nvous proposez",
    "Modifiez votre adresse physique ",
    "Modifiez votre groupe\nsanguin et rhésus"
  ];
  final List<String> textu = <String>[
    "A call to the interface",
    "Changez votre adresse physique",
    "A call to the interface",
  ];

  String _description;
  String _adresse;
  bool val1 = false, val2 = false, val3 = false;
  BloodType _bloodType1 ;
  Rhesus _rhesus;
  String _bloodType;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).benevole,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              body: Column(children: <Widget>[
                SizedBox(
                  height: 29, //it should be the size of the bar of each device
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
                                    child:
                                        Image.asset("assets/images/Retour.png"),
                                    backgroundColor: Color(0xFF00B9FF),
                                  ),
                                  Text(
                                    "      Paramètres des services",
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
                      ),
                      Center(
                        child: Column(children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 7),
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
                    itemBuilder: (BuildContext context, int index) =>
                        ExpansionTile(
                            leading: CircleAvatar(
                              radius: 20,
                              child: Image.asset("assets/images/${img[index]}"),
                              backgroundColor: Colors.white10,
                            ),
                            //initiallyExpanded: false,
                            subtitle: Text(sub[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  color: Color(0x35000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                            backgroundColor: Colors.white10,
                            title: Text(para[index],
                                style: TextStyle(
                                  fontFamily: 'Poppins-Medium',
                                  color: Color(0xff000000),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                            children: [
                          ///********************************insert changes here */
                          para[index] == para[0]
                              ? Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3.5,
                                      child: Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    Checkbox(
                                                      value: val1,
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          val1 = value;
                                                        });
                                                      },
                                                    ),
                                                    Text('Apporter des médicaments',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins-Light',
                                                      fontSize: 16
                                                    ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Checkbox(
                                                      value: val2,
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          val2 = value;
                                                        });
                                                      },
                                                    ),
                                                    Text('Donner du sang',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins-Light',
                                                      fontSize: 16
                                                    ),),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Checkbox(
                                                      value: val3,
                                                      onChanged: (bool value) {
                                                        setState(() {
                                                          val3 = value;
                                                        });
                                                      },
                                                    ),
                                                    Text('Loger des patients',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins-Light',
                                                      fontSize: 16
                                                    ),),
                                                  ],
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 30.0),
                                                    child: TextFormField(
                                                      initialValue:
                                                          userData.description,
                                                      decoration: InputDecoration(
                                                        hintText:
                                                            ' Autres services',
                                                        hintStyle: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.grey[400],
                                                          fontFamily:
                                                              'Poppins-Light',
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Poppins-Regular'),
                                                      onChanged: (val) {
                                                        setState(() =>
                                                            _description = val);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ]),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                        onPressed: () {
                                          DatabaseService(uid: user.uid)
                                              .updateService1(val1);
                                          DatabaseService(uid: user.uid)
                                              .updateService1(val2);
                                          DatabaseService(uid: user.uid)
                                              .updateService1(val3);
                                          DatabaseService(uid: user.uid)
                                              .updateDescription(_description);
                                        },
                                        child: Text(
                                          'Confirmer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins-Light'),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        color: Color(0xFF00B9FF)),
                                  ],
                                )
                              : para[index] == para[1]
                                  ? Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          child: Card(
                                            color: Colors.white,
                                            child: Row(
                                              children: <Widget>[
                                                Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 50.0),
                                                    child: TextFormField(
                                                      initialValue:
                                                          userData.adresse,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: textu[index],
                                                        hintStyle: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.grey[400],
                                                          fontFamily:
                                                              'Poppins-Light',
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Poppins-Regular'),
                                                      onChanged: (val) {
                                                        setState(() =>
                                                            _adresse = val);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                        RaisedButton(
                                            onPressed: () {
                                              DatabaseService(uid: user.uid)
                                                  .updateAdress(_adresse);
                                            },
                                            child: Text(
                                              'Confirmer',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins-Light'),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            color: Color(0xFF00B9FF)),
                                      ],
                                    )
                                  : Column(children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        child: Card(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Radio(
                                                      value: BloodType.A,
                                                      groupValue: _bloodType1,
                                                      onChanged: (BloodType value) {
                                                        setState(() {
                                                          _bloodType1 = value;
                                                          _bloodType = 'A';
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      'A ',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width / 4,),
                                                    Radio(
                                                      value: BloodType.B,
                                                      groupValue: _bloodType1,
                                                      onChanged: (BloodType value) {
                                                        setState(() {
                                                          _bloodType1 = value;
                                                          _bloodType = 'B';
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      'B ',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Radio(
                                                      value: BloodType.AB,
                                                      groupValue: _bloodType1,
                                                      onChanged: (BloodType value) {
                                                        setState(() {
                                                          _bloodType1 = value;
                                                          _bloodType = 'AB';
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      'AB',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width / 4,),
                                                    Radio(
                                                      value: BloodType.O,
                                                      groupValue: _bloodType1,
                                                      onChanged: (BloodType value) {
                                                        setState(() {
                                                          _bloodType1 = value;
                                                          _bloodType = 'O';
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      'O ',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                  child: const Divider(color: Colors.grey, thickness: 01,),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Radio(
                                                      value: Rhesus.plus,
                                                      groupValue: _rhesus,
                                                      onChanged: (Rhesus value) {
                                                        setState(() {
                                                          _rhesus = value;
                                                          _bloodType += '+' ;
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      '+ ',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.width / 4,),
                                                    Radio(
                                                      value: Rhesus.minus,
                                                      groupValue: _rhesus,
                                                      onChanged: (Rhesus value) {
                                                        setState(() {
                                                          _rhesus = value;
                                                          _bloodType += '-' ;
                                                        });
                                                      },
                                                      activeColor: Color(0xFF00B9FF),
                                                    ),
                                                    new Text(
                                                      '- ',
                                                      style: new TextStyle(
                                                          fontSize: 16.0,
                                                          fontFamily: 'Poppins-Light',),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                        ),
                                      ),
                                      RaisedButton(
                                            onPressed: () {
                                              if (_bloodType.isNotEmpty) {
                                                DatabaseService(uid: user.uid)
                                                  .updateBloodType(_bloodType);
                                                  setState(() {
                                                    _bloodType = '';
                                                  });
                                                  }
                                            },
                                            child: Text(
                                              'Confirmer',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins-Light'),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            color: Color(0xFF00B9FF)),
                                    ]),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.grey),
                    itemCount: 3,
                    padding: const EdgeInsets.all(18),
                    scrollDirection: Axis.vertical,
                    //reverse: true,
                    addAutomaticKeepAlives: true,
                    cacheExtent: 100,
                  ),
                ),
              ]),
            );
          } else
            return Loading();
        });
  }
  
  //void initialize()

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
