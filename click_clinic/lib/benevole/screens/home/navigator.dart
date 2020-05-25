import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Try extends StatefulWidget {
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  File _image;

  @override
  Widget build(BuildContext context) {
    
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
          print('Image Path $_image');
      });
    }

    return Material(
      child: Scaffold(
              body: Stack(
          children:<Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF4F8F9), //background
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 280.0,
              decoration: BoxDecoration(
                color: Color(0xFF00B9FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77)),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 360,
              child: Padding(
                padding: EdgeInsets.only(top:200),
                child: Center(
                  child: Container(
                  padding: EdgeInsets.symmetric(vertical:100, horizontal:100),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(55)),
                  ),
              ),
                ) ,
              ),
            )
            
          ]
        ),
      ),
      
    );
  }
}