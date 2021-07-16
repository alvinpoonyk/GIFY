import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreItemCard extends StatelessWidget {
  const ExploreItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 285, maxHeight: 200, minHeight: 200),
                child: Image.network(
                    'https://picsum.photos/id/${Random().nextInt(100).toString()}/300/200'),
              ),
              SizedBox(height: 20),
              Text(
                'Blue Denim Jeans',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on_rounded, size: 18),
                  SizedBox(width: 10),
                  Text(
                    'Chinatown',
                    style: GoogleFonts.sen(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 285, minHeight: 30),
                child: Text(
                  'Bought it from an online store but it was the wrong size (XS) hence giving it away for anyone who needs it',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/id/${Random().nextInt(237).toString()}/300/200'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Lorem Ipsum Dolor',
                    style: GoogleFonts.sen(fontSize: 14, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
