/*import 'package:click_clinic/acceuil.dart';
import 'package:shared_preferences/shared_preferences.dart';*/
import 'package:click_clinic/benevole/screens/wrapper.dart';
import 'package:click_clinic/benevole/services/auth.dart';
import 'package:click_clinic/benevole/models/user.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/patient/principal.dart';

String initValue;

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initValue = await prefs.getString("initValue");
  await prefs.setString("initValue", widget.path);
  print('initValue ${initValue}');
}*/
    

class Switcher extends StatelessWidget {

  final String path;
  Switcher({this.path });
  
  @override
  Widget build(BuildContext context) {
    return path == 'benevole' ?///initValue == '' || initValue == null ? MaterialApp(
       StreamProvider<User>.value(  
                           value: AuthService().user,
                           child: MaterialApp( //maybe it won't be a material app widget
                                  home: Wrapper(),
                                 ),
                           ) : Patient(); 
      /*initialRoute: initValue == "benevole"  ? "patient" : "benevole",
      routes: {
        'benevole' :(context) => StreamProvider<User>.value(  
                           value: AuthService().user,
                           child: MaterialApp( //maybe it won't be a material app widget
                                  home: Wrapper(),
                                 ),
                           ), 
        'patient' :(context) => Patient()
      }
    ): Acceuil(); */
  } 
}