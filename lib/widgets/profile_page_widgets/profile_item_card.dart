import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 315, minWidth: 315, maxHeight: 365 , minHeight: 365),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 300, minWidth: 300, maxHeight: 175, minHeight: 175),
                child: Image.network(
                    'https://picsum.photos/300/175'),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 300, minWidth: 300,
                ),
                child: SelectableText(
                  'Blue Denim Jeans',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
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
                constraints: BoxConstraints(maxWidth: 300, minHeight: 30, maxHeight: 30),
                child: SelectableText(
                  'Bought it from an online store but it was the wrong size (XS) hence giving it away for anyone who needs it',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.black),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(kDarkGreen),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                    onPressed: () {},
                    child: Container(
                      width: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: GoogleFonts.sen(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: kDarkGreen))),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        'Remove',
                        style: GoogleFonts.sen(
                            fontSize: 12,
                            color: kDarkGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}