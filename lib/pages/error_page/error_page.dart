import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/login_sign_up_page/login_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        drawer: const TopNavDrawer(),
        key: _scaffoldKey,
        body: Padding(
          padding: _width > 1600 ? EdgeInsets.symmetric(horizontal: _width * 0.1)
              : const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavigationBar(scaffoldKey: _scaffoldKey),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                              child: SvgPicture.asset("image/errorImage.svg",)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                          child: SelectableText(
                            "Oops, something went wrong...",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: _width > 768 ? 32 : 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        SelectableText(
                          "We've searched high & low for the page you requested but no dice, maybe try something else...",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: _width > 768 ? 20 : 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(color: kDarkGreen))),
                            ),
                            onPressed: () => Get.toNamed('/explore'),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                widthFactor: 1.0,
                                child: Text(
                                  'Redirect Me',
                                  style: GoogleFonts.sen(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: kDarkGreen,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
