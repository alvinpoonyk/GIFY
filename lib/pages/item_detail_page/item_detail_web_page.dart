import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailPageWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            navigationBar(screenWidth: _width, scaffoldKey: _scaffoldKey),
            Padding(
              padding:
              EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 500,
                              minWidth: 500,
                              minHeight: 300,
                              maxHeight: 300),
                          child: Image.network(
                              'https://picsum.photos/id/237/500/300'),
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 500,
                              minWidth: 500,
                              minHeight: 300,
                              maxHeight: 300),
                          child: Image.network(
                              'https://picsum.photos/500/300'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          'Blue Denim Jeans',
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            SelectableText(
                              'Chinatown',
                              style: GoogleFonts.sen(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.category_rounded,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            SelectableText(
                              'Electronics',
                              style: GoogleFonts.sen(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              size: 30,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SelectableText(
                                'Available for pickup after 7pm on weekdays',
                                style: GoogleFonts.sen(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ConstrainedBox(
                          constraints:
                          BoxConstraints(minHeight: 150, maxHeight: 300),
                          child: SelectableText(
                            'I am giving away a Acer laptop that I am no longer using. Comes with anti-virus subscription of remaining 1 year and operating on latest version of Windows 10. Feel free to drop me a message through the platform if you need it.',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(kDarkGreen),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ))),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                            child: Text(
                              'Message Now',
                              style: GoogleFonts.sen(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              minRadius: 30,
                              maxRadius: 30,
                              backgroundImage: NetworkImage(
                                  'https://picsum.photos/300/200'),
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Lorem Ipsum Dolor',
                              style: GoogleFonts.sen(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: _width,
              color: kDarkGreen,
              child: Center(
                child: SelectableText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}