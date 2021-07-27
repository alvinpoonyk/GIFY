import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/widgets/brand_logo.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavigationBar({Key? key, required this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                    onPressed: () =>Get.toNamed("/"),
                    child: Text(
                      'Explore',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    onPressed: () =>Get.toNamed("/login"),
                    child: Text(
                      'Login',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    onPressed: () =>Get.toNamed("/profile"),
                    child: Text(
                      'Profile',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
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