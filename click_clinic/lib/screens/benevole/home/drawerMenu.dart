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
              height: MediaQuery.of(context).size.height / 4, 
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/volunteer.png",
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    "Bénévole",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Quicksand",
                        fontStyle: FontStyle.normal,
                        fontSize: MediaQuery.of(context).size.height / 35, 
                      ),
                      textAlign: TextAlign.center,
                      )
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 11
            ), 
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
                "assets/images/gear.png", 
                height: MediaQuery.of(context).size.height / 25,
              ),
              title: Text(
                "Paramètres",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "CircularStd",
                    fontStyle: FontStyle.normal,
                    fontSize: MediaQuery.of(context).size.height / 37, 
                  ),
                  textAlign: TextAlign.center)),
          Divider(
            thickness: 1.0,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Payments");
                contact();
              },
              leading: Image.asset(
                "assets/images/env.png",
                height: MediaQuery.of(context).size.height / 25,
              ),
              title: Text(
                "Contact",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize: MediaQuery.of(context).size.height / 37,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          Divider(
            thickness: 1.0,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Notifications");
              },
              leading: Image.asset(
                "assets/images/h.png", 
                height: MediaQuery.of(context).size.height / 25,
              ),
              title: Text(
                "À propos",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize: MediaQuery.of(context).size.height / 37,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          Divider(
            thickness: 1,
          ),
          ListTile(
              onTap: () {
                debugPrint("Tapped Log Out");
                AuthService().signOut();
              },
              leading: Image.asset(
                "assets/images/out.png",
                height:  MediaQuery.of(context).size.height / 25,
              ),
              title: Text(
                "Déconnexion",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff000000),
                  fontSize:MediaQuery.of(context).size.height / 37,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: MediaQuery.of(context).size.height / 4), 
          Text(
            "ClickClinic 1.0.0",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Color(0x35000000),
              fontSize: MediaQuery.of(context).size.height / 47,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
//still an issue in the buttom of the drawer idk how to solve it (tile size is unchangeable)