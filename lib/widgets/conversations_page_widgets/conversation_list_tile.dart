import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsListTile extends StatelessWidget {
  const ConversationsListTile({Key? key, required double width,}) : _width = width, super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _width * 0.05, vertical: 14),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              minRadius: _width <= 414 ? 30 : 50,
              maxRadius: _width <= 414 ? 30 : 50,
              backgroundImage: NetworkImage(
                  'https://picsum.photos/id/${Random().nextInt(100)}/300/200'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: _width * 0.7, minWidth: _width * 0.7),
                    child: Text(
                      'Lorem Ipsum Dolor',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: _width <= 414 ? 12 : 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 5),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: _width * 0.7, minWidth: _width * 0.7),
                    child: Text(
                      'Hey, saw your item listed. Just want to check with you what is the screen size of the laptop and the hardware specifications such as RAM, storage size and number of USB ports?'.substring(0,140),
                      style: GoogleFonts.sen(
                          fontSize: _width <= 414 ? 10 : 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}