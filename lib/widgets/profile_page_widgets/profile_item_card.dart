import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/profile_page_controller.dart';
import 'package:gify/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileItemCard extends StatelessWidget {
  final Item item;
  const ProfileItemCard({Key? key, required this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilePageController _controller = Get.find();
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 500, maxHeight: 365 , minHeight: 365),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                    maxWidth: 300, minWidth: 300, maxHeight: 175, minHeight: 175),
                child: Image.network(
                    item.images.first),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300, minWidth: 300,
                ),
                child: SelectableText(
                  item.name,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
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
                constraints: const BoxConstraints(maxWidth: 300, minHeight: 30, maxHeight: 30),
                child: SelectableText(
                  item.description,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.black),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
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
                  const SizedBox(width: 12),
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
                    onPressed: () {
                      _controller.removeItem();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
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