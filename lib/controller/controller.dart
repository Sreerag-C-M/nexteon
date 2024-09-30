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
      var items = await ApiService().fetchGalleryItems();
      galleryItems.assignAll(items);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
