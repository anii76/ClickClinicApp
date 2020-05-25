import 'package:flutter/material.dart';
import 'package:click_clinic/benevole/screens/wrapper.dart';
import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/benevole/models/user.dart';
import 'package:provider/provider.dart';

class Benevole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp( 
        home: Wrapper(),
        ),
    );
  }
}