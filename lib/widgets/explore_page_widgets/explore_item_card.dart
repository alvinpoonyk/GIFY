import 'package:flutter/material.dart';
import 'package:gify/models/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ExploreItemCard extends StatelessWidget {
  final Item item;
  const ExploreItemCard({required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Map<String, String> params = {"id" : item.id};
          Get.toNamed("/item/", arguments: item, parameters: params);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: 285, maxWidth: 500, maxHeight: 200, minHeight: 200),
                child: Image.network(
                    'https://picsum.photos/1080/768'),
              ),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 285, minHeight: 30),
                child: Text(
                  item.name,
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    item.location,
                    style: GoogleFonts.sen(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 500, maxWidth: 500, minHeight: 45, maxHeight: 45),
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
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/300/200'),
                  ),
                  const SizedBox(width: 10),
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
