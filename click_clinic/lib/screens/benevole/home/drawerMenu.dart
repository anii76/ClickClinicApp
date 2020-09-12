import 'package:click_clinic/screens/benevole/benevole.dart';
import 'package:click_clinic/screens/benevole/home/navigator.dart';
import 'package:click_clinic/services/auth.dart';
import 'package:click_clinic/shared/parametreApp.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:url_launcher/url_launcher.dart';

class BenevoleLayout extends StatefulWidget {
  @override
  _BenevoleLayoutState createState() => _BenevoleLayoutState();
}

class _BenevoleLayoutState extends State<BenevoleLayout> {
  FSBStatus drawerStatus;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SwipeDetector(
          onSwipeLeft: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },
          onSwipeRight: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_OPEN;
            });
          },
          child: FoldableSidebarBuilder(
            drawerBackgroundColor: const Color(0xff00b9ff),
            drawer: CustomDrawer(
              closeDrawer: () {
                setState(() {
                  drawerStatus = FSBStatus.FSB_CLOSE;
                });
              },
            ),
            screenContents: Try(),
            status: drawerStatus,
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  void contact() {
    String mailto =
        'mailto:a.bourouina@esi-sba.dz?subject=FeedBack&body:write your feed back';
    launch(mailto);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200, //change
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/volunteer.png",
                    width: 100, //change
                    height: 100, //change
                  ),
                  SizedBox(
                    height: 10, //change
                  ),
                  Text("Bénévole",
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Quicksand",
                        fontStyle: FontStyle.normal,
                        fontSize: 23, //change
                      ),
                      textAlign: TextAlign.center)
                ],
              )),
          SizedBox(height: 70), //change
          ListTile(
              onTap: () {
                debugPrint("Tapped settings");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ParaDapp();
                  },
                ));
              },
              leading: Image.asset(
                "assets/images/gear.png", //change height
              ),
              title: Text("Paramètres",
                  style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "CircularStd",
                    fontStyle: FontStyle.normal,
                    fontSize: 21, //change
                  ),
                  textAlign: TextAlign.center)),
          Divider(
            thickness: 1.0,
            //color: Colors.grey,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Payments");
                contact();
              },
              leading: Image.asset(
                "assets/images/env.png", //change height
              ),
              title: Text(
                "Contact",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize: 21, //change
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          Divider(
            thickness: 1.0,
            //color: Colors.grey,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Notifications");
              },
              leading: Image.asset(
                "assets/images/h.png", //change height
              ),
              title: Text(
                "À propos",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize: 21, //change
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          Divider(
            thickness: 1,
            //color: Colors.grey,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Log Out");
                AuthService().signOut();
              },
              leading: Image.asset(
                "assets/images/out.png", //change height
              ),
              title: Text(
                "Déconnexion",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize: 21, //change
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 200), //change
          Text(
            "ClickClinic 1.0.0",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Color(0x35000000),
              fontSize: 17, //change
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
