import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';

class ItemsRepositoryImpl implements ItemsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).get().
    then((querySnapshot) => querySnapshot.docs.forEach((documentSnapshot) {
      items.add(Item.fromJson(documentSnapshot.data()));
    }));
    return items;
  }

  @override
  Future<List<Item>> getItemsByCategory({required String category}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).where('category', isEqualTo: category).get().
    then((querySnapshot) => querySnapshot.docs.forEach((documentSnapshot) {
      data.add(Item.fromJson(documentSnapshot.data()));
    }));
    return data;
  }

  @override
  Future<List<Item>> getItemsByLocation({required location}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false).where('location', isEqualTo: location).get().
    then((querySnapshot) => querySnapshot.docs.forEach((documentSnapshot) {
      data.add(Item.fromJson(documentSnapshot.data()));
    }));
    return data;
  }

  @override
  Future<List<Item>> getItemsByCategoryAndLocation({required category, required location}) async {
    List<Item> data = [];
    await _db.collection('items').where('isRemoved', isEqualTo: false)
        .where('category', isEqualTo: category).where('location', isEqualTo: location).get().
    then((querySnapshot) => querySnapshot.docs.forEach((documentSnapshot) {
      data.add(Item.fromJson(documentSnapshot.data()));
    }));
    return data;
  }

}