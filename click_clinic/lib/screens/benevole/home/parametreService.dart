import 'package:flutter/material.dart';


class ParaDesServices extends StatefulWidget {
  @override
  _ParaDesServicesState createState() => _ParaDesServicesState();
}

class _ParaDesServicesState extends State<ParaDesServices> {
  final List<String> para = <String>[
   "Services proposés",
    "Mon adresse",
    "Groupe sanguin",
  ];
  final List<String> img = <String>[
    "a.png",
    "homy.png",
    "sang.png",
  ];
  final List<String> sub = <String>[
    "Modifiez les services que\nvous proposez",
    "Modifiez l'adresse de votre\nlogement",
    "Modifiez votre groupe\nsanguin et rhésus"
  ];
      final List<String> textu = <String>[
    "A call to the interface",
    "Aller à la carte",
    "A call to the interface",
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: 29, //it should be the size of the bar of each device
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
                            "      Paramètres des services",
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
                      "assets/images/OBJECTS.png",
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) =>  ExpansionTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/${img[index]}"),
                  backgroundColor: Colors.white10,
                ),
                //initiallyExpanded: false,
                subtitle: Text(sub[index],
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Color(0x35000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                backgroundColor: Colors.white10,
                title: Text(para[index],
                    style: TextStyle(
                      fontFamily: 'CircularStd',
                      color: Color(0xff000000),
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width /1.2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: TextFormField(
                                    //initialValue: textu[index],
                                    decoration: InputDecoration(
                                      hintText: textu[index],
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[400],
                                        fontFamily: 'Poppins-Light',
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Regular'),
                                    onChanged: (val) {
                                      String _password;
                                      setState(() => _password = val);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                   SizedBox(height: 10,),
                  //ListTile(),
                ]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.grey),
            itemCount: 3,
            padding: const EdgeInsets.all(18),
            scrollDirection: Axis.vertical,
            //reverse: true,
            addAutomaticKeepAlives: true,
            cacheExtent: 100,

           

          ),
        ),
      ]),
    );
  }
}
