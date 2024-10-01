import 'package:get/get.dart';
import '../model/modelclass.dart';
import '../service/serviceres.dart';

class GalleryController extends GetxController {
  var isLoading = true.obs;
  var galleryItems = <GalleryItem>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchGalleryItems();
    super.onInit();
  }

  void fetchGalleryItems() async {
    try {
      isLoading(true);
      errorMessage('');
      print('Fetching gallery items...');
      var items = await ApiService().fetchGalleryItems();
      galleryItems.assignAll(items);
      print('Fetched items: $items');
    } catch (e) {
      errorMessage(e.toString());
      print('Error: $e');
    } finally {
      isLoading(false);
      print('Loading state: ${isLoading.value}');
    }
  }
}
