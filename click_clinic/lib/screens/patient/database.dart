import 'package:click_clinic/shared/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final dataBase = FirebaseDatabase.instance.reference().child('Medcins').orderByChild("doctors");
  List lists = ['','',7];
  List l;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
                title: Text('Search Result'),
          ),
          body: StreamBuilder(
          stream: dataBase.onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasData) {
              lists.clear();
              lists = ['Baby',];
              DataSnapshot dataValues = snapshot.data.snapshot;
              Map<dynamic, dynamic> values = dataValues.value;
              values.forEach((key, values) {
                print(lists);
                lists.add(values);
              });
              print(lists.length);
              print(lists[1][2]);
              l = lists[1];
              l = l.where((x) => x["Doctor speciality"].toString() == "Cardiologue").map((x) => x).toList();
              return Material(
                  child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: l.length-1,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("Nom: " ),
                                        Text(l[index+1]["Doctor name"].toString()),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Specialité: " ),
                                        Text(l[index+1]["Doctor speciality"].toString()),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Adresse: " ),
                                        Text(
                                          l[index+1]["Doctor adress"].toString(),
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Telephone: " ),
                                        Text(l[index+1]["Telephone"].toString()),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Latitude: " ),
                                        Text(l[index+1]["Latitude"].toString().replaceAll(',', '.')),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Longitude: "),
                                        Text(l[index+1]["Longitude"].toString().replaceAll(',', '.')),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ));
            } else return Loading();
          }),
    );
  }
}
/*List<User> userList = [];
dataBase = FirebaseDatabase.instance.reference().child("user");
dataBase.once().then((DataSnapshot snapshot){
 Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key,values) {
       print(values["name"]);
       // here insert all the user into a list
       userList.add(values["name"];
    });
 }); */


class Doctor {
  final String adresse;
  final String name;
  final String speciality;
  final int tel;
  final Map location;

  Doctor({this.adresse,this.name,this.speciality,this.location,this.tel}); 
}