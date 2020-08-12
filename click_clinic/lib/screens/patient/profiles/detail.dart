import 'package:click_clinic/models/etablissment.dart';
import 'package:click_clinic/services/searchResult.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final String id;
  final DocumentSnapshot collection;
  Details(this.id, {@required this.collection});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var etablisData = widget.collection.data;
    var phone ='', detail;
    if (etablisData["Speciality"] != null){
      phone = "+213 " + etablisData["Phone number"];
      detail = etablisData["Speciality"];
    }else{
      detail = etablisData["Owner"];
      if (etablisData["Phone"] != ''){
        phone = "+213 "+ "${etablisData["Phone"]}";
      }else{
        phone = " _ ";
      }
    }

    return etablisData != null
        ? Material(
            child: Scaffold(
                body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F8F9), //background
                  ),
                ),
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
                Center(
                    child: Column(children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 120)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Flexible(
                        child: Text(
                          etablisData["Name"],
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  CircleAvatar(
                    child: Image.asset('assets/images/Med.png'),
                    backgroundColor: Colors.transparent,
                    radius: 80,
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //Owner || Speciality
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Image.asset('assets/images/Group 2476.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        detail,
                        style: TextStyle(
                          fontFamily: "CircularStd-Book",
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Adresse
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Image.asset('assets/images/Group 2477.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          etablisData["Adress"],
                        style: TextStyle(
                          fontFamily: "CircularStd-Book",
                          fontSize: 18
                        ),
                          ),
                          ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Phone
                  FlatButton(
                    onPressed: () {
                      call(phone);
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 34,
                        ),
                        Image.asset('assets/images/tele.png'),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          phone,
                        style: TextStyle(
                          fontFamily: "CircularStd-Book",
                          fontSize: 18
                        ),
                        ),
                      ],
                    ),
                  ),
                ])),
              ],
            )),
          )
        : Loading();
  }

  void call(String phone){
    String phoneno ='tel:'+phone;
    launch(phoneno);
  }
}
