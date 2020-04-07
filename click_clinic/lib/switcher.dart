import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Switcher extends StatelessWidget {
  final String connexion = 'assets/connexion.svg';
  @override
  Widget build(BuildContext context) {
    
    //returns patient or benevole based on pressed button
    //also the choosing screen is shown only at first launch
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*Container( 
              child:*/ SvgPicture.asset(
               connexion,
               //alignment: Alignment.topCenter,
               height: 200,
             ),
              //margin: EdgeInsets.only(top: 30, left: 76,),
           //),
            Text('Heureux de vous revoir !',
             ),
            
            RaisedButton(onPressed: null, child: Text('Connexion')),
            Column(
              children: [FlatButton(onPressed: null, child: Text('Vous n\'avez de compte? INSCRIVEZ VOUS !')),
            FlatButton(onPressed: null, child: Text('Mot de passe oublié?'))]),
            
          ]
        ) 
      ),
    );
  }
}