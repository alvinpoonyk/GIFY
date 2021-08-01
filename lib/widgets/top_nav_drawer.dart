import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNavDrawer extends StatelessWidget {
  const TopNavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _controller = Get.find();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                if (_controller.isUserLoggedIn())
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 40,
                      backgroundImage: NetworkImage(_controller.getCurrentUser().profileImage),
                    ),
                  ),
                TextButton(
                  onPressed: () => Get.offAndToNamed("/"),
                  child: Text(
                    'Explore',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, color: Colors.black),
                  ),
                ),
                Obx(() => _controller.isUserLoggedIn() ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () {
                      Map<String, String> params = {"id" : _controller.getCurrentUserID()};
                      Get.offAndToNamed("/conversations/", parameters: params);
                    },
                    child: Text(
                      'Conversations',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.black),
                    ),
                  ),
                ) : Container()),
                Obx(() => _controller.isUserLoggedIn() ?
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () {
                      Map<String, String> params = {"id" : _controller.getCurrentUserID()};
                      Get.offAndToNamed("/profile/", parameters: params);
                    },
                    child: Text(
                      'Profile',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.black),
                    ),
                  ),
                ) : Container()),
                const SizedBox(height: 20),
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
                        fontSize: 14, color: Colors.black),
                  ),
                )),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
