import 'package:gify/models/item.dart';

abstract class ItemsRepository {

  Future<List<Item>> getItems ();
  Future<List<Item>> getItemsByCategory({required String category});
  Future<List<Item>> getItemsByLocation({required String location});
  Future<List<Item>> getItemsByCategoryAndLocation({required category, required location});

}
