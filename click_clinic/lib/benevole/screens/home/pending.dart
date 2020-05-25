import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getflutter/getflutter.dart';

class MyAppp extends StatefulWidget {
  @override
  _MyApppState createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  File _image;
  String _url;
  String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: _image == null ? _imageUrl == null ? null : NetworkImage(_imageUrl) : FileImage(_image),
                  radius: 80,
                ),
                GestureDetector(onTap: pickImage, child: Icon(Icons.camera_alt))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) => RaisedButton(
                    onPressed: _image != null ?() {
                      uploadImage(context);
                    }: null,
                    child: Text('Upload Image'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://test-193e1.appspot.com');
      StorageReference ref = storage.ref().child(_image.path);
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }


  void initState() {
    super.initState();

    var ref = FirebaseStorage.instance.ref().child('Bénévoles/messenger-code.jpg');
    ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
  }
}
  

