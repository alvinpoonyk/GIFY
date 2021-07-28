import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/item_detail_page_controller.dart';
import 'package:gify/models/item.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ItemDetailPageWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final ItemDetailPageController _controller = Get.find();
    final Item _item = _controller.item;
    return Scaffold(
      drawer: const TopNavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(scaffoldKey: _scaffoldKey),
            Padding(
              padding:
              EdgeInsets.only(left: _width * 0.05, right: _width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 500,
                              minWidth: 500,
                              minHeight: 300,
                              maxHeight: 300),
                          child: Image.network(_item.images[0]),
                        ),
                        const SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 500,
                              minWidth: 500,
                              minHeight: 300,
                              maxHeight: 300),
                          child: Image.network(_item.images[1]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          _item.name,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              size: 30,
                            ),
                            const SizedBox(width: 20),
                            SelectableText(
                              _item.location,
                              style: GoogleFonts.sen(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.category_rounded,
                              size: 30,
                            ),
                            const SizedBox(width: 20),
                            SelectableText(
                              _item.category,
                              style: GoogleFonts.sen(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule_rounded,
                              size: 30,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SelectableText(
                                _item.availability,
                                style: GoogleFonts.sen(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ConstrainedBox(
                          constraints:
                          const BoxConstraints(minHeight: 150, maxHeight: 300),
                          child: SelectableText(
                            _item.description,
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 40),
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
                            padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
                            child: Text(
                              'Message Now',
                              style: GoogleFonts.sen(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        FutureBuilder(
                            future: _controller.getItemOwnerByID(ownerID: _item.ownerID),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      minRadius: 30,
                                      maxRadius: 30,
                                      backgroundImage: NetworkImage(_controller.owner.profileImage),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      _controller.owner.displayName,
                                      style: GoogleFonts.sen(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(color: kLightGreen),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
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