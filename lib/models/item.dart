class Item {

  final String id;
  final String name;
  final List images;
  final String ownerID;
  final String location;
  final String category;
  final String description;
  final String availability;
  final bool isRemoved;

  Item(
      {required this.id, required this.name, required this.images, required this.ownerID,
        required this.location, required this.category, required this.description, required this.availability, required this.isRemoved});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        name: json['name'],
        images: json['images'],
        ownerID: json['ownerID'],
        location: json['location'],
        category: json['category'],
        description: json['description'],
        availability: json['availability'],
        isRemoved: json['isRemoved'],
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

