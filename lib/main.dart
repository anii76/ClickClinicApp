import 'package:flutterapp/paraDesServices.dart';
import 'package:flutterapp/paraDuCompte.dart';

import 'pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData(
          // scaffoldBackgroundColor: Colors.white24,
         // primaryColor: Colors.white
         ),
      home:ParaDapp(),
    ),//GroupeSang(),//Patient(),// 
  );
}






