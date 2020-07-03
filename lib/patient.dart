import 'pages.dart';

class PatientLayout extends StatefulWidget {
  @override
  _PatientLayoutState createState() => _PatientLayoutState();
}

class _PatientLayoutState extends State<PatientLayout> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 220),
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {},
                child: CircleAvatar(
                  radius:15,
                  child: Image.asset("assets/icones/menu.png"),
                  backgroundColor: Color(0xFF00B9FF),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 150 ),
                      child: Image.asset("assets/images/l.png"),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 150)),
                Text(
                  'Que cherchez-vous ?',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'Poppins-Medium'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/medecin.png"),
                          backgroundColor: Colors.blueGrey[100],
                        ),
                        Text(
                          "     Un médecin",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/hopital.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "     Un hôpital",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/phramacie.png"),
                          backgroundColor: Colors.lightGreen[100],
                        ),
                        Text(
                          "    Une pharmacie",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/sang.png"),
                          backgroundColor: Colors.red[100],
                        ),
                        Text(
                          "     Du sang",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          child: Image.asset("assets/icones/autre.png"),
                          backgroundColor: Colors.grey[200],
                        ),
                        Text(
                          "     Autre",
                          style: TextStyle(
                              fontSize: 22, fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  width: 340,
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
