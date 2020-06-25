import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:getflutter/getflutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  bool _isVisible = false;
  String _imageUrl;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    // upload pic to firebase storage
    Future uploadPic(BuildContext context) async {
      try {
        String fileName = basename(_image.path);
        StorageReference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('Bénévoles/${fileName}');
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
        StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
        setState(() {
          print("Profile Picture uploaded");
          _isVisible = false;
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Profile Picture Uploaded')));
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Edit Profile'),
      ),
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Stack(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: GFAvatar(
                      shape: GFAvatarShape.standard,
                      radius: 100,
                      backgroundColor: Color(0xff528fff),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 190.0,
                          height: 190.0,
                          child: (_image == null)
                              ? _imageUrl == null
                              ? Image.asset(
                                  //default image
                                  "assets/images/clickclinic.png",
                                  fit: BoxFit.fill,
                                )
                              : NetworkImage(_imageUrl)
                              : Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                        setState(() {
                          _isVisible = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              _isVisible
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Cancel',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        RaisedButton(
                          color: Color(0xff476cfb),
                          onPressed: () {
                            uploadPic(context);
                          },
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          child: Text(
                            'Submit',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ],
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}

//services.dart + pending.dart ==> avatar
//navigator => home page UI
//edit setting pages and minimize
