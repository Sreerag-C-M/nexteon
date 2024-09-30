import 'package:get/get.dart';
import '../model/modelclass.dart';
import '../service/serviceres.dart';


class GalleryController extends GetxController {
  var galleryItems = <GalleryItem>[].obs;
  var isLoading = true.obs;

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
    } finally {
      isLoading(false);
    }
  }
}
