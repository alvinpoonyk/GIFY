import 'package:get/get.dart';
import 'package:gify/models/item.dart';
import 'package:gify/repositories/items_repository.dart';
import 'package:gify/repositories/items_repository_impl.dart';

class ItemDetailPageController extends GetxController {

  final ItemsRepository _itemsRepository = ItemsRepositoryImpl();

  var id;
  var item;

  ItemDetailPageController({this.id, this.item});

  Future<void> getItemByID({required String id}) async {
    try {
        final Item fetchedItem = await _itemsRepository.getItemById(id: id);
        item = fetchedItem;
        print("ItemDetailPageController(getItemByID): Get and set item $id success");
      }
    catch(e) {
    print("ItemDetailPageController(getItemByID): ${e.toString()}");
    }
  }


}