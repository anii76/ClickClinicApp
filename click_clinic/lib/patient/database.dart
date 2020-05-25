import 'package:click_clinic/shared/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final dataBase = FirebaseDatabase.instance.reference().child("Medecins").child("doctors");
  List lists ;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dataBase.onValue,
        builder: (context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            Map<dynamic, dynamic> values = dataValues.value;
            values.forEach((key, values) {
              print(values);
              lists.add(values);
            });
            return Material(
                child: SingleChildScrollView(
                    child: Scaffold(
                        appBar: AppBar(
                          title: Text('Search Result'),
                        ),
                       body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Nom: " + lists[index+1]["Doctor name"]),
                                  Text("Specialité: " +
                                      lists[index+1]["Doctor speciality"]),
                                  Text("Adresse: " +
                                      lists[index+1]["Doctor adress"]),
                                  Text("Telephone: " +
                                      lists[index+1]["Telephone"]),
                                  Text("Latitude: " + lists[index+1]["Latitude"]),
                                  Text("Longitude: " +
                                      lists[index+1]["Longitude"]),
                                ],
                              ),
                            );
                          },
                        ))));
          } else return Loading();
        });
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
