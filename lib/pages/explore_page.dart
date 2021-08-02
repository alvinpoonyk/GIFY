import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gify/constants/filters.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/controllers/explore_page_controller.dart';
import 'package:gify/widgets/explore_page_widgets/category_drop_down_button.dart';
import 'package:gify/widgets/explore_page_widgets/explore_item_card.dart';
import 'package:gify/widgets/explore_page_widgets/location_drop_down_button.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  final ExplorePageController _controller = Get.put(ExplorePageController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        drawer: const TopNavDrawer(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationBar(scaffoldKey: _scaffoldKey),
              if (!_authController.isUserLoggedIn())
              Padding(
                padding:
                    EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: _width * 0.9,
                  height: _width > 768 ? 150 : 120,
                  decoration: const BoxDecoration(
                    color: kDarkGreen,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20),
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
                                      side: const BorderSide(color: Colors.white))),
                        ),
                        onPressed: () => Get.offAndToNamed('/sign-up'),
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
              const SizedBox(height: 30.0),
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
              const SizedBox(height: 20.0),
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
                    Obx(()=> CategoryDropdownButton(
                      hintText: _controller.category.value,
                      items: kCategories,
                    )),
                    const SizedBox(width: 20),
                    Obx(()=> LocationDropdownButton(
                      hintText: _controller.location.value,
                      items: kLocations,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              // Card Grid System
              Obx(() { return _controller.itemsToDisplay.isEmpty ?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: Center(
                  child: SelectableText(
                    'No items found with the selected filter(s)',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sen(
                        fontSize: _width > 768 ? 18 : 12,
                        color: kLightGreen),
                  ),
                ),
              )
                  :
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: _width >= 768 ? GridView.builder(
                      itemCount: _controller.itemsToDisplay.length,
                      shrinkWrap: true,
                      controller: _scrollController,
                      addAutomaticKeepAlives: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 440,
                      crossAxisSpacing: 10,
                      crossAxisCount: _width > 768 ? 4 : 2,
                      ),
                      itemBuilder: (context, index) {
                          return ExploreItemCard(item: _controller.itemsToDisplay[index]);
                        },
                    )
                    : ListView(
                        controller: _scrollController,
                        addAutomaticKeepAlives: true,
                        shrinkWrap: true,
                        children: _controller.itemsToDisplay.map((item) => ExploreItemCard(item: item)).toList()),
                );}
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
