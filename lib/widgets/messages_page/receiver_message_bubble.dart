import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/auth_controller.dart';
import 'package:gify/models/message.dart';
import 'package:gify/models/user.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiverMessageBubble extends StatelessWidget {
  final Message message;

  const ReceiverMessageBubble({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final AuthController _authController = Get.find();
    final User _currentUser = _authController.getCurrentUser();
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0,
                          3), // changes position of shadow
                    ),
                  ],
                  color: kDarkGreen,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(0),
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                  ),
                ),
                padding: _width < 768
                    ? const EdgeInsets.fromLTRB(10, 8, 8, 8)
                    : const EdgeInsets.fromLTRB(
                    20, 12, 12, 12),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: _width * 0.7,
                  ),
                  child: SelectableText(
                    message.text,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize:
                      _width < 768 ? 12 : 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "18 Jul 2021, 01:12",
                style: GoogleFonts.roboto(
                  fontSize: _width < 768 ? 10 : 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          SizedBox(width: _width < 768 ? 10 : 20),
          CircleAvatar(
            backgroundImage: NetworkImage(_currentUser.profileImage),
            minRadius: _width < 768 ? 20 : 30,
            maxRadius: _width < 768 ? 20 : 30,
          ),
        ],
      ),
    );
  }
}