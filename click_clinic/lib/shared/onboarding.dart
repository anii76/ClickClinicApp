import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'acceuil.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3; //page num
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool toggle = false;

  Future navigateToAcceuil(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Acceuil()));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: MediaQuery.of(context).size.height / 100,
      width: isActive ? 16.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF00B9FF) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return !toggle
        ? Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      /*gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.22, 0.4, 0.7, 0.9],
                        colors: [
                          Colors.blue[300],
                          Colors.blue[200],
                          Colors.blue[100],
                          Colors.blue[50],
                          Colors.white
                        ],
                      ),*/
                      color: Color(0xFFF4F8F9)
                    ),
                  ),
                  /*Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          print('Passer');
                          toggle = true;
                          //navigateToAcceuil(context);
                        },
                        child: Text(
                          _currentPage == _numPages - 1 ? '' : 'Passer',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ),
                    ),
                  ),*/
                  Align(
                    alignment: Alignment(0, -0.2),
                    child: Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Padding(
                            //first page
                            padding: EdgeInsets.only(
                                bottom: 20.0,
                                left: 40.0,
                                right: 40.0,
                                top: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/welcome.png',
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: 300.0, //
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        30),
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Bienvenue',
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20),
                                      Text(
                                        'Vous pouvez glisser à droite pour vous aider',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'à choisir votre profil ou cliquez sur',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'commencer pour l\'ignorer',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            //second page
                            padding: EdgeInsets.only(
                                bottom: 20.0,
                                left: 40.0,
                                right: 40.0,
                                top: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/find.png',
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        30),
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Trouvez',
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20),
                                      Text(
                                        'En tant que patient, vous pouvez chercher',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'parmi les médecins,hopitaux ou pharmacies',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'les plus adaptés à votre situation',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            //third page
                            padding: EdgeInsets.only(
                                bottom: 20.0,
                                left: 40.0,
                                right: 40.0,
                                top: 40.0),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/onboarding-3.png',
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        30),
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Aidez',
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20),
                                      Text(
                                        'Si vous souhaitez aider des patients dans le',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'besoin, vous pouvez vous porter bénévole',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      ),
                                      Text(
                                        'en leur offrant vos services',
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Light',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                57,
                                            color: Color(0xFF95989A)),
                                      )
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
                  Align(
                    alignment: Alignment(0, 0.55),
                    child: Row(
                      //page indicator
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: SizedBox(
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Color(0xFF00B9FF),
                          width: 2,
                        ),
                        focusColor: Colors.white,
                        highlightColor: Colors.white,
                        hoverColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Acceuil();
                                        },
                                      ));
                        },
                        child: Text("Commencer",
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: MediaQuery.of(context).size.height / 40,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF00B9FF)
                        ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)), 
                      ),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 14,
                    ),
                  ),

                  /*Align(
                    alignment: Alignment(0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _currentPage == _numPages - 1 //if we hit the end
                            ? Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Acceuil();
                                        },
                                      ));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Commancer',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17.0,
                                              fontFamily: 'Poppins-Medium'),
                                        ),
                                        SizedBox(width: 5.0),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          )
        : Acceuil();
  }
}
