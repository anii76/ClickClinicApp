
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
      home: Patient(),//BenevoleLayout(),
      )
  );
}










