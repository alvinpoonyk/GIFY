import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/custom_drop_down_button.dart';
import 'package:gify/widgets/explore_item_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    double _childAspectRatioBasedOnBreakpoints({required double screenWidth}) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              navigationBar(screenWidth: _width, scaffoldKey: _scaffoldKey),
              SizedBox(height: 20.0),
              // Carousel
              Padding(
                padding:
                    EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: _width * 0.9,
                  height: _width > 768 ? 150 : 120,
                  decoration: BoxDecoration(
                    color: kDarkGreen,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        'Join a community of people that are giving away items for free! ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sen(
                            fontSize: _width > 768 ? 22 : 16,
                            color: Colors.white),
                      ),
                      SizedBox(height: _width > 768 ? 25 : 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kDarkGreen),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          _width > 768 ? 10 : 5),
                                      side: BorderSide(color: Colors.white))),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: _width > 768
                              ? EdgeInsets.fromLTRB(30, 10, 30, 10)
                              : EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.sen(
                                fontSize: _width > 768 ? 20 : 12,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              // Explore Text
              Padding(
                padding:
                    EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                child: SelectableText(
                  'Explore',
                  style: GoogleFonts.montserrat(
                      fontSize: _width > 768 ? 26 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              if (_width <= 768)
                Padding(
                  padding: EdgeInsets.only(
                      left: _width * 0.05, right: _width * 0.05, bottom: 20),
                  child: SelectableText(
                    'Filter by: ',
                    style: GoogleFonts.sen(fontSize: 16, color: Colors.black),
                  ),
                ),
              // Filters
              Padding(
                padding:
                    EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                child: Row(
                  mainAxisAlignment: _width > 768
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_width > 768)
                      SelectableText(
                        'Filter by: ',
                        style:
                            GoogleFonts.sen(fontSize: 20, color: Colors.black),
                      ),
                    // SizedBox(width: 10),
                    CustomDropdownButton(
                      width: _width,
                      hintText: 'Select Category',
                      items: kCategories,
                    ),
                    SizedBox(width: 20),
                    CustomDropdownButton(
                      width: _width,
                      hintText: 'Select Location',
                      items: kLocations,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              // Card Grid System
              Padding(
                padding: EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                child: _width >= 768 ? GridView.count(
                    addAutomaticKeepAlives: true,
                    childAspectRatio: _childAspectRatioBasedOnBreakpoints(screenWidth: _width),
                    shrinkWrap: true,
                    crossAxisCount: _width > 768 && _width > 1024 ? 4 : 2,
                    children: List.generate(12, (index) => ExploreItemCard()))
                    : ListView(
                        addAutomaticKeepAlives: true,
                        shrinkWrap: true,
                        children: List.generate(12, (index) => ExploreItemCard()),
                )
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
