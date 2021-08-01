import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/controllers/item_detail_page_controller.dart';
import 'package:gify/models/conversation.dart';
import 'package:gify/models/item.dart';
import 'package:gify/widgets/item_detail_page_widgets/custom_carousel_slider.dart';
import 'package:gify/widgets/top_nav_bar.dart';
import 'package:gify/widgets/top_nav_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailTabletAndMobileView extends StatelessWidget {

  final ItemDetailPageController _controller = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Item _item = _controller.item;
    double _width = MediaQuery.of(context).size.width;
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
                  images: _item.images.map((s) => s.toString()).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      _item.name,
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
                          _item.location,
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
                          _item.category,
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
                            _item.availability,
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
                        _item.description,
                        style: GoogleFonts.roboto(
                            fontSize: _width <= 414 ? 14 : 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                        future: _controller.getItemOwnerByID(ownerID: _item.ownerID),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  minRadius: _width <= 414 ? 20 : 30,
                                  maxRadius: _width <= 414 ? 20 : 30,
                                  backgroundImage: NetworkImage(
                                      _controller.owner.profileImage),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  _controller.owner.displayName,
                                  style: GoogleFonts.sen(
                                      fontSize: _width <= 414 ? 14 : 18, color: Colors.black),
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(color: kLightGreen),
                            );
                          }
                        }),
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
                      onPressed: () async {
                        if (!_authController.isUserLoggedIn()) {
                          Get.offAndToNamed("/login");
                        } else {
                          bool? isConversationExist = await _controller.isConversationExist(itemID: _item.id, currentUserID: _authController.getCurrentUserID(), itemOwnerID: _item.ownerID);
                          if (isConversationExist!) {
                            Conversation? remoteConversation = await _controller.getExistingConversation(itemID: _item.id, currentUserID: _authController.getCurrentUserID());
                            Get.offAndToNamed('/messages/', arguments: remoteConversation);
                          } else {
                            Conversation? localConversation = _controller.createConversation(itemID: _item.id, currentUserID: _authController.getCurrentUserID(), itemOwnerID: _item.ownerID);
                            Get.offAndToNamed('/messages/', arguments: localConversation);
                          }
                        }
                      },
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