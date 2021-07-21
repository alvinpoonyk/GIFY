import 'package:gify/models/item.dart';

class ItemModel extends Item {

  ItemModel({required String id, required String name, required List images, required String ownerID,
    required String location, required String category, required String description, required String availability, required bool isRemoved})
      : super(id: id, name: name, images: images, ownerID: ownerID, location: location, category: category, description: description, availability: availability, isRemoved: isRemoved);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        id: json['id'], name: json['name'], images: json['images'], ownerID: json['ownerID'], location: json['location'],
        category: json['category'], description: json['description'], availability: json['availability'], isRemoved: json['isRemoved']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'images' : images,
      'ownerID' : ownerID,
      'location' : location,
      'category' : category,
      'description' : description,
      'availability' : availability,
      'isRemoved' : isRemoved,
    };
  }

}