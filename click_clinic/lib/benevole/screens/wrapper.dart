import 'package:click_clinic/benevole/screens/authenticate/autheticate.dart';
import 'package:click_clinic/benevole/screens/home/home.dart';
import 'package:click_clinic/benevole/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}