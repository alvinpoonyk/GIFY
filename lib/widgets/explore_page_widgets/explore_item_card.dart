import 'package:flutter/material.dart';
import 'package:gify/constants/styles.dart';
import 'package:gify/controllers/explore_page_controller.dart';
import 'package:gify/models/item.dart';
import 'package:gify/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ExploreItemCard extends StatelessWidget {
  final Item item;
  const ExploreItemCard({required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExplorePageController _controller = Get.put(ExplorePageController());
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
                    minWidth: 285, maxHeight: 200, minHeight: 200),
                child: Image.network(item.images.first),
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
                constraints: const BoxConstraints(minWidth: 500, minHeight: 45, maxHeight: 45),
                child: Text(
                  item.description,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<User>(
                  future: _controller.getItemOwner(id: item.ownerID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      User itemOwner = snapshot.data!;
                      return Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 20,
                            minRadius: 20,
                            backgroundImage: NetworkImage(
                                itemOwner.profileImage),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            itemOwner.displayName,
                            style: GoogleFonts.sen(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: kLightGreen),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
