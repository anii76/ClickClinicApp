import 'package:click_clinic/benevole/screens/home/settings/deleteacc.dart';
import 'package:click_clinic/benevole/screens/home/settings/emailset.dart';
import 'package:click_clinic/benevole/screens/home/settings/nameset.dart';
import 'package:click_clinic/benevole/screens/home/settings/passwordset.dart';
import 'package:click_clinic/benevole/screens/home/settings/phoneset.dart';
import 'package:flutter/material.dart';


class Settings extends StatelessWidget { //set a bridge between home nd settings

  Future navigateToPhoneSet(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => PhoneSet()));
  }
  Future navigateToEmailSet(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => EmailSet()));
  }
  Future navigateToNameSet(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => NameSet()));
  }
  Future navigateToPasswordSet(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => PasswordSet()));
  }
  Future navigateToDelAcc(context) async { 
    Navigator.push(context,MaterialPageRoute(builder: (context) => DeleteAccount()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paramètres du compte")),
      body: Center(child: Column(
        children:[
          SizedBox(
            height: 80.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              FlatButton.icon(
                onPressed: (){
                  return navigateToNameSet(context);
                }, //go to emailset.dart 
                label: Row(children: [
                  Column(children: <Widget>[
                      Text("   Identifiant   ",), //add some styling here
                      Text("   Changer votre adresse de courriel   "),
              ]),
                  Icon(Icons.arrow_right)
              ]), 
                icon:Icon(
                  Icons.person,
                  size: 25.0,
                  ), 
                ), 
            ],
          ), //Name set
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              FlatButton.icon(
                onPressed: (){}, //go to emailset.dart 
                label: Row(children: [
                  Column(children: <Widget>[
                      Text("   Adresse e-mail   ",), //add some styling here
                      Text("   Changer votre adresse de courriel   "),
              ]),
                  Icon(Icons.arrow_right)
              ]), 
                icon:Icon(
                  Icons.mail,
                  size: 25.0,
                  ), 
                ), 
            ],
          ), //mail
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              FlatButton.icon(
                onPressed: (){
                  navigateToPhoneSet(context);
                }, //go to emailset.dart 
                label: Row(children: [
                  Column(children: <Widget>[
                      Text("   Téléphone   ",), //add some styling here
                      Text("   Changer votre adresse de courriel   "),
              ]),
                  Icon(Icons.arrow_right)
              ]), 
                icon:Icon(
                  Icons.phone,
                  size: 25.0,
                  ), 
                ), 
            ],
          ), //phone
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              FlatButton.icon(
                onPressed: (){}, //go to emailset.dart 
                label: Row(children: [
                  Column(children: <Widget>[
                      Text("   Mot de passe    ",), //add some styling here
                      Text("   Changer votre adresse de courriel   "),
              ]),
                  Icon(Icons.arrow_right)
              ]), 
                icon:Icon(
                  Icons.vpn_key,
                  size: 25.0,
                  ), 
                ), 
            ],
          ), //password
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              FlatButton.icon(
                onPressed: (){}, //go to emailset.dart 
                label: Row(children: [
                  Column(children: <Widget>[
                      Text("   Supprimer votre compte   ",), //add some styling here
                      Text("   Changer votre adresse de courriel   "),
              ]),
                  Icon(Icons.arrow_right)
              ]), 
                icon:Icon(
                  Icons.account_box,
                  size: 25.0,
                  ), 
                ), 
            ],
          ), //delAcc
          SizedBox(),
          /*RaisedButton(
            onPressed: () {return Home();},
            child: Text('Home'),
            ),//home*/
        ]
      ),)
      
    );
  }
}
//normalement hadi tji stateless m3a we7da kima hak stateful
//this would be done in home 
//then i'll transmit it
//and here i'd be doing t3 stateful