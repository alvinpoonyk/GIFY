import 'package:dartz/dartz.dart';
import 'package:gify/errors/failure.dart';
import 'package:gify/models/image_file.dart';
import 'package:gify/models/item.dart';

abstract class ItemsRepository {

  Future<Either<Failure,List<Item>>> getItems();
  Future<Either<Failure,List<Item>>> getItemsByCategory({required String category});
  Future<Either<Failure,List<Item>>> getItemsByLocation({required String location});
  Future<Either<Failure,List<Item>>> getItemsByCategoryAndLocation({required category, required location});
  Future<void> createItem({required Map<String, dynamic> itemData, required ImageFile imageFile1, required ImageFile imageFile2});
  Stream<List<Item>> getUserItemsStream({required String userID});
  Future<void> removeItem({required String id});
  Future<Item> getItemById({required String id});
  Future<void> editItem({required String id, required Map<String, dynamic> itemData, ImageFile? imageFile1, ImageFile? imageFile2});
}
