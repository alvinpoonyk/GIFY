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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 285, maxWidth: 500, maxHeight: 200, minHeight: 200),
                child: Image.network(
                    'https://picsum.photos/1080/768'),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 285, minHeight: 30),
                child: Text(
                  'Blue Denim Jeans',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
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
                constraints: BoxConstraints(minWidth: 500, maxWidth: 500, minHeight: 45, maxHeight: 45),
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
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/300/200'),
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
