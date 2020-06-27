import 'package:flutter/material.dart';
class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  GlobalKey globalKey = GlobalKey();
  Offset _offset = Offset(0, 0);
  List<double> limits = [];

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
    double step = (constLimit - start) / 3;
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

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: sidebarSize,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.localPosition.dx <= sidebarSize) {
                setState(() {
                  _offset = details.localPosition;
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
                Center(
                  child: Text(
                    'Que cherchez-vous ?',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'Poppins-Medium'),
                  ),
                ),
                SizedBox(
                  width: sidebarSize,
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
                                      iconData: Icons.settings,
                                      height: (menuContainerHeight / 3),
                                    ),
                                    MyButton(
                                      text: "Contact",
                                      textSize: getSize(0),
                                      iconData: Icons.contact_mail,
                                      height: (menuContainerHeight / 3),
                                    ),
                                    MyButton(
                                      text: "À propos",
                                      textSize: getSize(0),
                                      iconData: Icons.notification_important,
                                      height: (menuContainerHeight / 3),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
  final IconData iconData;
  final double height;
  MyButton({this.text, this.textSize, this.iconData, this.height});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black45, fontSize: textSize),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
