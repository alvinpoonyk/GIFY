import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNavDrawer extends StatelessWidget {
  const TopNavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Explore',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Profile',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 7, child: Container()),
        ],
      ),
    );
  }
}
