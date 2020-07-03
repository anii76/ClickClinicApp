import 'pages.dart';


class Donneur extends StatefulWidget {
  @override
  _DonneurState createState() => _DonneurState();
}

class _DonneurState extends State<Donneur> {

final GlobalKey<FireMapState> _key = new GlobalKey<FireMapState>();
  

  String dropdownValue = '  Votre groupe sanguin';
  var sp = <String>[
    '  Votre groupe sanguin',
    '  A+','  A-','  B+','  B-','  AB+','  AB-','  O+','  O-',
   
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          child: Carte(
            key: _key,
            Width: MediaQuery.of(context).size.width,
            Height: MediaQuery.of(context).size.height / 1.5,
          ),
          alignment: Alignment.bottomCenter,
        ),
          Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Stack(
            children: [
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
              Positioned(
                bottom: 25,
                right: 25,
                left: 25,
                top: -50,
                child: Align(
                  alignment: Alignment(-0.45, -0.45),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: RaisedButton(
                      color: Color(0xFF00B9FF),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 10,
                            child: Image.asset("assets/images/Retour.png"),
                            backgroundColor: Color(0xFF00B9FF),
                          ),
                          Text(
                            "      Donneur de sang",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'Poppins-Light'),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 7),
                  SizedBox(
                    child: Image.asset(
                      "assets/images/bene.png",
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ]),
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
          /*padding: EdgeInsets.only(top: 305, left: 90, right: 30),*/
          alignment: Alignment(0.34,-0.22),
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
                
                
                //_key.currentState.method(dropdownValue.replaceAll('  ', ''));
                
                
                print(dropdownValue.replaceFirst(new RegExp(r' '), ''));
               }),
        ))
            ],
          ),
        ),
        
        
      ],

      ),

    );
  }

}

