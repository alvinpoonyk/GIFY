import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/login_sign_up_page/login_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: const TopNavDrawer(),
        key: _scaffoldKey,
        body: Padding(
          padding: _width > 1600 ? EdgeInsets.symmetric(horizontal: _width * 0.1)
              : const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavigationBar(scaffoldKey: _scaffoldKey),
              _width > 1368 ? Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                  color: kDarkGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 130),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                'Discover items that people are giving away for free',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 30),
                              SelectableText(
                                'On GIFY, you will find many different items that people are giving away easily, all for for free.'
                                    '\n'
                                    '\n'
                                    'Reduce waste, give it to someone who needs it and help make a difference!',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: _width >= 1366 ? const EdgeInsets.symmetric(vertical: 50, horizontal: 90) :
                          const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                          child: LoginCard(),
                        ),
                      ),
                    ],
                  ),
                ),
              ) : Expanded(
                child: Container(
                  padding: _width >= 768 ? const EdgeInsets.symmetric(vertical: 20, horizontal: 100) : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: kDarkGreen,
                  child: Column(
                    children: [
                       LoginCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
