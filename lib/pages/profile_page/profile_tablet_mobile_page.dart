import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/profile_page_controller.dart';
import 'package:gify/widgets/profile_page_widgets/profile_item_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageTabletAndMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final ScrollController _scrollController = ScrollController();
    final ProfilePageController _controller = Get.put(ProfilePageController());
    return SafeArea(
      child: Scaffold(
        drawer: const TopNavDrawer(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBar(scaffoldKey: _scaffoldKey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      minRadius: _width <= 414 ? 60 : 80,
                      maxRadius: _width <= 414 ? 60 : 80,
                      backgroundImage: const NetworkImage(
                          'https://picsum.photos/200/200'),
                    ),
                    SizedBox(height: _width <= 414 ? 10 : 20),
                    SelectableText(
                      'Lorem Ipsum Dolor',
                      style: GoogleFonts.montserrat(fontSize: _width <= 414 ? 14 : 16, color: Colors.black),
                    ),
                    SizedBox(height: _width <= 414 ? 10 : 20),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(kDarkGreen),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                      onPressed: () {},
                      child: Container(
                        width: 180,
                        padding: EdgeInsets.all(_width <= 414 ? 4 : 8),
                        child: Center(
                          child: Text(
                            'Add an Item',
                            style: GoogleFonts.sen(
                              fontSize: _width <= 414 ? 12 : 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _width <= 414 ? 30 : 40),
                    SelectableText(
                      'Your Item Listings',
                      style: GoogleFonts.montserrat(
                          fontSize: _width <= 414 ? 14 : 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              _width >= 768 ?
              GridView.count(
                  addAutomaticKeepAlives: true,
                  childAspectRatio: 315/310,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: _controller.itemsToDisplay.map((item) => ProfileItemCard(item: item)).toList()) :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    children: _controller.itemsToDisplay.map((item) => ProfileItemCard(item: item)).toList()),
                    // children: List.generate(12, (index) => ProfileItemCard())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}