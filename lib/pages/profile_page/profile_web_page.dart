import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/controllers/profile_page_controller.dart';
import 'package:gify/widgets/profile_page_widgets/profile_item_card.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ProfilePageWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final ScrollController _scrollController = ScrollController();
    final ProfilePageController _controller = Get.put(ProfilePageController());
    final AuthController _authController = Get.find();
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CircleAvatar(
                              minRadius: 80,
                              maxRadius: 80,
                              backgroundImage: NetworkImage(_authController.getCurrentUser().profileImage),
                            ),
                            const SizedBox(height: 20),
                            SelectableText(
                              _authController.getCurrentUser().displayName,
                              style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(kDarkGreen),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ))),
                              onPressed: () => Get.toNamed('/add-item'),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Add an Item',
                                    style: GoogleFonts.sen(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              'Your Item Listings',
                              style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Obx(() => GridView.count(
                                controller: _scrollController,
                                addAutomaticKeepAlives: true,
                                childAspectRatio: _width > 1024 ? 315/330 : 315/340,
                                shrinkWrap: true,
                                crossAxisCount: _width > 1024 ? 3 : 2,
                                children: _controller.itemsToDisplay.map((item) => ProfileItemCard(item: item)).toList()),
                                // children: List.generate(12, (index) => ProfileItemCard())),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}