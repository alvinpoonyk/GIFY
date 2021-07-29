import 'package:gify/models/image_file.dart';
import 'package:gify/models/item.dart';

abstract class ItemsRepository {

  Future<List<Item>> getItems();
  Future<List<Item>> getItemsByCategory({required String category});
  Future<List<Item>> getItemsByLocation({required String location});
  Future<List<Item>> getItemsByCategoryAndLocation({required category, required location});
  Future<void> createItem({required Map<String, dynamic> itemData, required ImageFile imageFile1, required ImageFile imageFile2});
  // Future<List<Item>> getUserItems({required String userID});
  Stream<List<Item>> getUserItemsStream({required String userID});
  Future<void> removeItem({required String id});
  Future<Item> getItemById({required String id});
}
