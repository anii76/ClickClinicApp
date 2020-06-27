import 'pages.dart';

class GroupeSang extends StatefulWidget {
  @override
  _GroupeSangState createState() => _GroupeSangState();
}

class _GroupeSangState extends State<GroupeSang> {
  String dropdownValue = '  Groupe sanguin';
  var sp = <String>[
    '  Groupe sanguin',
    '  A',
    '  B',
    '  AB',
    '  O',
  ];
  String drop = '  Rhésus';
  var rh = <String>[
    '  Rhésus',
    '  Positif (+)',
    '  Négatif (-)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:
                MediaQuery.of(context).size.height / 2.36, //apply everywhere
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.3,
                    0.7,
                    0.9
                  ],
                  colors: [
                    Color(0xFF00D0E1),
                    Color(0xFF00B3FA),
                    Color(0xFF00B9FF),
                  ]),
              //color: Color(0xFF00B9FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(77),
                  bottomRight: Radius.circular(77)),
            ),
          ),
          Align(
            alignment: Alignment(-0.8, -0.8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.15,
              /*child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 210),*/
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 15,
                  child: Image.asset("assets/images/Retour.png"),
                  backgroundColor: Color(0xFF00B9FF),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                
              ),
            ),
          ),
          Center(
            child: Column(children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 5.6),
              SizedBox(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Ajouter votre groupe sanguin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Poppins-Regular'),
                      ),
                      SizedBox(height: 2),
                      Text(
                        " Sélectionnez votre groupe sanguin\n et votre rhésus.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Poppins-Regular'),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 5.8),

              SizedBox(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.search, color: Colors.white),
                        backgroundColor: Color(0xFF00B3FA),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width / 1.18,
                height: 70,
              ),
                 Align(
              /*padding: EdgeInsets.only(top: 305, left: 90, right: 30),*/
              alignment: Alignment(0.68, -0.22),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    style: dropdownValue == sp[0]
                        ? TextStyle(
                            fontSize: 19,
                            color: Colors.grey[700],
                            fontFamily: 'Poppins-Medium')
                        : TextStyle(
                            fontSize: 21,
                            color: Color(0xB3000000),
                            fontFamily: 'SegoeUI'),
                    items: sp.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        print(newValue);
                      });

                      //  _key.currentState.method(dropdownValue.replaceAll('  ', ''));

                      print(dropdownValue.replaceFirst(new RegExp(r' '), ''));
                    }),
              )),
             
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.search, color: Colors.white),
                        backgroundColor: Color(0xFF00B3FA),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width / 1.18,
                height: 70,
              ),
               Align(
                 
                  alignment: Alignment(0.68, -0.22),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: DropdownButton<String>(
                        value: drop,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 20,
                        style: drop == rh[0]
                            ? TextStyle(
                                fontSize: 19,
                                color: Colors.grey[700],
                                fontFamily: 'Poppins-Medium')
                            : TextStyle(
                                fontSize: 21,
                                color: Color(0xB3000000),
                                fontFamily: 'SegoeUI'),
                        items: rh.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            drop = newValue;
                            print(newValue);
                          });

                          //   _key.currentState.method(drop.replaceAll('  ', ''));

                          print(
                              drop.replaceFirst(new RegExp(r' '), ''));
                        }),
                  )),
            ]),
          ),
       
        ],
      ),
      bottomSheet: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.12,
              child: RaisedButton(
                color: Color(0xFF00B9FF),
                onPressed: () {},
                child: Text(
                  "  Inscrire",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Poppins-Light'),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
    );
  }
}
