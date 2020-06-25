import 'package:click_clinic/screens/patient/database.dart';
import 'package:click_clinic/shared/loading.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShowDataPage extends StatefulWidget {
  @override
  _ShowDataPageState createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  List<Doctor> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference().child('Medcins');
    ref.child('doctors').child('9099').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        Doctor d = new Doctor(
          name: data[key]['Doctor name'],
          adresse: data[key]['Doctor adress'],
          speciality: data[key]['Doctor speciality'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
          child: allData.length == 0
              ? Loading()
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].name,
                      allData[index].adresse,
                      allData[index].speciality,
                    );
                  },
                )),
    );
  }

  Widget UI(String name, String profession, String message) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Name : $name',style: Theme.of(context).textTheme.title,),
            new Text('Adresse : $profession'),
            new Text('Speciality : $message'),
          ],
        ),
      ),
    );
  }
}
