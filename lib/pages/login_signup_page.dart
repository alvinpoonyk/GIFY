import 'dart:html';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginSignupPage extends StatelessWidget
{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Align buildEntry(String entryName)
  {
    return Align(
      alignment: Alignment.topLeft,
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
            color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
              left: 15, bottom: 11, top: 11, right: 15),
          hintText: "Enter your $entryName",
          hintStyle: GoogleFonts.roboto(
            fontSize: 16,
            color: Color(0xFFC4C4C4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    double _width = MediaQuery.of(context).size.width;

    double _childAspectRatioBasedOnBreakpoints({required double screenWidth})
    {
      ///Wide Screen Display
      if (screenWidth > 1024)
        return 300/390;
      /// Medium Screen Display
      if (screenWidth > 768 && screenWidth <= 1024)
        return 300/285;
      /// Tablet Screen Display
      return 300/380;
    }
    return SafeArea(
        child: Scaffold(
          drawer: TopNavDrawer(),
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        navigationBar(
                            screenWidth: _width, scaffoldKey: _scaffoldKey),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 92,
                          color: kDarkGreen,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 150.0,),
                                    Text("Discover items that people \n are giving away for free",
                                        style: GoogleFonts.sen(fontSize: 30, color: Colors.white),
                                    ),
                                    SizedBox(height: 30.0),
                                    Text("On GIFY, you will easily find many different \n items that people are giving away,\n all for free",
                                      style: GoogleFonts.sen(fontSize: 20, color: Colors.white),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text("Reduce waste, give it to someone who \n needs it and help make a difference",
                                      style: GoogleFonts.sen(fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Card(
                                  child: InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 100.0),
                                      width: 300,
                                      height: 600,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 50,),
                                          Text("Welcome!", style: GoogleFonts.sen(fontSize: 30, color: Colors.black),
                                          ),
                                          SizedBox(height: 30,),
                                          Align(
                                            alignment: Alignment.topLeft,
                                              child: Text("Username", style: GoogleFonts.sen(fontSize: 20, color: Colors.black),
                                              ),
                                          ),
                                          buildEntry("username"),

                                          SizedBox(height: 16,),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Password", style: GoogleFonts.sen(fontSize: 20, color: Colors.black),
                                            ),
                                          ),
                                          buildEntry("password"),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 100.0),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      kLightGreen),
                                                  shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12.0),
                                                      ))),
                                              onPressed: () {},
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(110, 8, 110, 8),
                                                child: Text(
                                                  ' Log In  ',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 16.0),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.white),
                                                  shadowColor:
                                                  MaterialStateProperty.all<Color>(
                                                      kDarkGreen),
                                                  shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12.0),
                                                      ))),
                                              onPressed: () {},
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(110, 8, 110, 8),
                                                child: Text(
                                                  'Sign Up',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
