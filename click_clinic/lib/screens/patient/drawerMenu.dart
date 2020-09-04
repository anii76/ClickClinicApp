import 'package:click_clinic/shared/parametreApp.dart';
import 'package:flutter/material.dart';
import 'package:click_clinic/screens/patient/principal.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientDrawer extends StatefulWidget {
  @override
  _PatientDrawerState createState() => _PatientDrawerState();
}

class _PatientDrawerState extends State<PatientDrawer> {
  GlobalKey globalKey = GlobalKey();
  Offset _offset = Offset(0, 0);
  List<double> limits = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double constLimit = position.dy + renderBox.size.height - 20;
    double step = (constLimit - start) / 4;
    limits = [];
    for (double x = start; x <= constLimit; x = x + step) {
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1] ? 25 : 20);
    return size;
  }

  void contact(){
    String mailto ='mailto:a.bourouina@esi-sba.dz?subject=FeedBack&body:write your feed back';
    launch(mailto);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Patient(),
              AnimatedPositioned(
                duration: Duration(milliseconds: 3000),
                left: isMenuOpen ? 0 : -sidebarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sidebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sidebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }
                      if (details.localPosition.dx > sidebarSize - 20 &&
                          details.delta.distanceSquared > 2) {
                        setState(() {
                          isMenuOpen = true;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sidebarSize, mediaQuery.height),
                          painter: DrawerPainterp(offset: _offset),
                        ),
                        Container(
                          width: sidebarSize,
                          height: mediaQuery.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                height: mediaQuery.height * 0.25,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/patient.png",
                                        height: mediaQuery.height / 6,
                                        width: sidebarSize / 2,
                                      ),
                                      Text(
                                        "Patient",
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(thickness: 1.0),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: <Widget>[
                                    MyButton(
                                      text: "Paramètres",
                                      textSize: getSize(0),
                                      iconData: "assets/images/gear.png",
                                      height: (menuContainerHeight / 3),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ParaDapp();
                                          },
                                        ));
                                      },
                                    ),
                                    MyButton(
                                      text: "Contact",
                                      textSize: getSize(1),
                                      iconData: "assets/images/env.png",
                                      height: (menuContainerHeight / 3),
                                      onPressed: () {contact();},
                                    ),
                                    MyButton(
                                      text: "À propos",
                                      textSize: getSize(2),
                                      iconData: "assets/images/h.png",
                                      height: (menuContainerHeight / 3),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: (isMenuOpen) ? 10 : sidebarSize,
                          bottom: 30,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "ClickClinic 1.0.0",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Color(0x35000000),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              IconButton(
                                enableFeedback: true,
                                icon: Icon(
                                  Icons.keyboard_backspace,
                                  color: Colors.black45,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isMenuOpen = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerPainterp extends CustomPainter {
  final Offset offset;
  DrawerPainterp({this.offset});
  double getControlPoint(double width) {
    if (offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        getControlPoint(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final double textSize;
  final String iconData;
  final double height;
  Function onPressed;
  MyButton(
      {this.text, this.textSize, this.iconData, this.height, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Img(iconData),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: textSize,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

class Img extends StatelessWidget {
  final String _assetPath;
  Img(this._assetPath);
  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.expand(height:0.9),
      decoration: BoxDecoration(color: Colors.white),
      child: Image.asset(_assetPath, fit: BoxFit.cover, width: 30.0),
    );
  }

}
