import 'package:flutter/material.dart';
import 'package:click_clinic/screens/benevole/wrapper.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/models/user.dart';
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