import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/widgets/brand_logo.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavigationBar({Key? key, required this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final AuthController _controller = Get.find();
    return Column(
      children: [
        _width > 768
            ? Padding(
          padding: EdgeInsets.only(
              left: _width * 0.05,
              right: _width * 0.05,
              top: 20,
              bottom: 20),
          child: Row(
            children: [
              const BrandLogo(fontSize: 30, iconSize: 36),
              Expanded(
                child: Container(),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Get.offAndToNamed("/"),
                    child: Text(
                      'Explore',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Obx(() => _controller.isUserLoggedIn() ? Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Map<String, String> params = {"id" : _controller.getCurrentUserID()};
                        Get.offAndToNamed("/conversations/", parameters: params);
                      },
                      child: Text(
                        'Conversations',
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ) : Container()),
                  const SizedBox(width: 30),
                  Obx(() => TextButton(
                    onPressed: () async {
                      if (_controller.isUserLoggedIn()) {
                        await _controller.logOutUser();
                      } else {
                        Get.offAndToNamed("/login");
                      }
                    },
                    child: Text(
                      _controller.isUserLoggedIn() ? 'Log Out' : 'Login',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )),
                  Obx(() => _controller.isUserLoggedIn() ? Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Map<String, String> params = {"id" : _controller.getCurrentUserID()};
                        Get.offAndToNamed("/profile/", parameters: params);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Profile',
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            minRadius: 15,
                            maxRadius: 15,
                            backgroundImage: NetworkImage(_controller.getCurrentUser().profileImage),
                          )
                        ],
                      ),
                    ),
                  ) : Container()),
                ],
              ),
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.reorder, size: 30),
              ),
              const SizedBox(width: 20),
              const BrandLogo(fontSize: 30, iconSize: 30),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}