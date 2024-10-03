import 'package:get/get.dart';
import '../model/modelclass.dart';
import '../service/serviceres.dart';



class GalleryController extends GetxController {
  var galleryItems = <GalleryItem>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchGalleryItems();
    super.onInit();
  }

  void fetchGalleryItems() async {
    print("Controller calling fetch items");
    try {
      isLoading(true);
      errorMessage('');
      var items = await ApiService().fetchGalleryItems();
      print("item trying to assign");
      print(items.list.length);
      galleryItems.value = items.list!;
      update();
    } catch(dioError) {
      errorMessage.addError("Exception");
    } finally {
      isLoading(false);
    }
  }
}
