import 'package:flutter/material.dart';
import 'package:gify/pages/profile_page/profile_tablet_mobile_page.dart';
import 'package:gify/pages/profile_page/profile_web_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    if (_width > 768)
      return ProfilePageWebView();
    return ProfilePageTabletAndMobileView();
  }
}