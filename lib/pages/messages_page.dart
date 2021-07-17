import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
                      const SizedBox(height: 10),
                      Padding(
                        padding: _width <= 768
                            ? EdgeInsets.all(0)
                            : EdgeInsets.symmetric(horizontal: _width * 0.05),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDarkGreen,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(_width <= 768
                                ? Radius.circular(0)
                                : Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.all(12),
                          width: _width <= 768 ? _width : _width * 0.9,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: 35,
                                    maxHeight: 35,
                                    maxWidth: 60,
                                    minWidth: 60,
                                  ),
                                  child: Image.network(
                                      'https://picsum.photos/60/35'),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Acer Aspire A515-56C',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: _width < 768 ? 16 : 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: _width * 0.05),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              /// Sender Message Bubble
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/200'),
                                      minRadius: _width < 768 ? 20 : 30,
                                      maxRadius: _width < 768 ? 20 : 30,
                                    ),
                                    SizedBox(width: _width < 768 ? 10 : 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: kLightGreen,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: _width < 768
                                              ? EdgeInsets.fromLTRB(10, 8, 8, 8)
                                              : EdgeInsets.fromLTRB(
                                                  20, 12, 12, 12),
                                          // padding: const EdgeInsets.fromLTRB(20,12,12,12),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: _width * 0.7,
                                            ),
                                            child: SelectableText(
                                              "Hey, saw your item listed. Just want to check with you what is the screen size of the laptop and the hardware specifications such as RAM, storage size and number of USB ports?  ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                fontSize:
                                                    _width < 768 ? 12 : 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "18 Jul 2021, 01:12",
                                          style: GoogleFonts.roboto(
                                            fontSize: _width < 768 ? 10 : 12,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              /// Receiver Message Bubble
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: kDarkGreen,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(0),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: _width < 768
                                              ? EdgeInsets.fromLTRB(10, 8, 8, 8)
                                              : EdgeInsets.fromLTRB(
                                                  20, 12, 12, 12),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: _width * 0.7,
                                            ),
                                            child: SelectableText(
                                              "Greetings, the laptop has a screen width of 25.5 inches, 8GB RAM, 500 GB SSD and has 3 USB 2.0 ports. Let me know if you are interested!",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                fontSize:
                                                    _width < 768 ? 12 : 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "18 Jul 2021, 01:12",
                                          style: GoogleFonts.roboto(
                                            fontSize: _width < 768 ? 10 : 12,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: _width < 768 ? 10 : 20),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/200'),
                                      minRadius: _width < 768 ? 20 : 30,
                                      maxRadius: _width < 768 ? 20 : 30,
                                    ),
                                  ],
                                ),
                              ),

                              ///
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/200'),
                                      minRadius: _width < 768 ? 20 : 30,
                                      maxRadius: _width < 768 ? 20 : 30,
                                    ),
                                    SizedBox(width: _width < 768 ? 10 : 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: kLightGreen,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: _width < 768
                                              ? EdgeInsets.fromLTRB(10, 8, 8, 8)
                                              : EdgeInsets.fromLTRB(
                                                  20, 12, 12, 12),
                                          // padding: const EdgeInsets.fromLTRB(20,12,12,12),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: _width * 0.7,
                                            ),
                                            child: SelectableText(
                                              "Hey, saw your item listed. Just want to check with you what is the screen size of the laptop and the hardware specifications such as RAM, storage size and number of USB ports?  ",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.roboto(
                                                fontSize:
                                                    _width < 768 ? 12 : 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "18 Jul 2021, 01:12",
                                          style: GoogleFonts.roboto(
                                            fontSize: _width < 768 ? 10 : 12,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    style: BorderStyle.solid,
                                    color: kDarkGreen),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Type your message here",
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        kDarkGreen),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ))),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                              child: Text(
                                'Send',
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  color: Colors.white,
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
