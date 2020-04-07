import 'package:click_clinic/benevole/screens/wrapper.dart';
import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/benevole/models/user.dart';
//import 'package:click_clinic/switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(  //import to switcher or t3 benevole later
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
