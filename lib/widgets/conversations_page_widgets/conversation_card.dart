import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300 , minWidth: 300),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              CircleAvatar(
                minRadius: 60,
                maxRadius: 60,
                backgroundImage: NetworkImage(
                    'https://picsum.photos/300/200'),
              ),
              SizedBox(height: 12),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300 , minWidth: 300),
                child: Text(
                  'Lorem Ipsum Dolor',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 40 , minWidth: 40),
                    child: Image.network( 'https://picsum.photos/300/200'),
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Acer Aspire A515-56C',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 270 , minWidth: 270, maxHeight: 60, minHeight: 60),
                child: SelectableText(
                  'Hey, saw your item listed. Just want to check with you what is the screen size of the laptop and the..',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 14, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(kDarkGreen),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'View Conversation',
                        style: GoogleFonts.sen(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}