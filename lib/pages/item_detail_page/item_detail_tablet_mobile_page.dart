import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/widgets/item_detail_page_widgets/custom_carousel_slider.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailTabletAndMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const TopNavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationBar(scaffoldKey: _scaffoldKey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: CustomCarouselSlider(
                  width: _width,
                  images: ['https://picsum.photos/id/239/${_width.toInt()}/${_width <= 414 ? 300 : 500}', 'https://picsum.photos/id/237/${_width.toInt()}/${_width <= 414 ? 300 : 500}'],),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      'Blue Denim Jeans',
                      style: GoogleFonts.montserrat(
                          fontSize: _width <= 414 ? 18 : 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: _width <= 414 ? 16 : 20,
                        ),
                        const SizedBox(width: 15),
                        SelectableText(
                          'Chinatown',
                          style: GoogleFonts.sen(
                            fontSize: _width <= 414 ? 16 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.category_rounded,
                          size: _width <= 414 ? 16 : 20,
                        ),
                        const SizedBox(width: 15),
                        SelectableText(
                          'Electronics',
                          style: GoogleFonts.sen(
                            fontSize: _width <= 414 ? 16 : 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: _width <= 414 ? 16 : 20,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: SelectableText(
                            'Available for pickup after 7pm on weekdays',
                            style: GoogleFonts.sen(
                              fontSize: _width <= 414 ? 16 : 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    ConstrainedBox(
                      constraints:
                      BoxConstraints(minHeight: _width <= 414 ? 50 : 150, maxHeight: 300),
                      child: SelectableText(
                        'I am giving away a Acer laptop that I am no longer using. Comes with anti-virus subscription of remaining 1 year and operating on latest version of Windows 10. Feel free to drop me a message through the platform if you need it.',
                        style: GoogleFonts.roboto(
                            fontSize: _width <= 414 ? 14 : 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          minRadius: _width <= 414 ? 20 : 30,
                          maxRadius: _width <= 414 ? 20 : 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/300/200'),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Lorem Ipsum Dolor',
                          style: GoogleFonts.sen(
                              fontSize: _width <= 414 ? 14 : 18, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(kDarkGreen),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                        child: Center(
                          child: Text(
                            'Message Now',
                            style: GoogleFonts.sen(
                              fontSize: _width <= 414 ? 16 : 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}