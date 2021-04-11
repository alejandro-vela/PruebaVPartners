import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/addDataScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

double _sigmaX = 0.0; // from 0-10
double _sigmaY = 0.0; // from 0-10
double _opacity = 0.3; // from 0-1.0

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Container(
                color: Colors.black.withOpacity(_opacity),
              ),
            ),
          ),
        ),
        Positioned(
          left: size.width * 0,
          top: -size.height * 0.5,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Container(
              height: size.height * 2,
              width: size.width,
              alignment: Alignment.center,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                child: Container(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: size.height * 0.9,
                width: size.width * 0.8,
                child: SafeArea(
                  top: true,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.white,
                      hintColor: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 80),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/logo1.png',
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            ButtonTheme(
                              minWidth: size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddDataScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Acceder',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                color: Color.fromRGBO(121, 63, 210, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
