import 'package:get/get.dart';
import '../model/modelclass.dart';
import '../service/serviceres.dart';


class GalleryController extends GetxController {
  var galleryItems = <GalleryItem>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchGalleryItems();
  }

  void fetchGalleryItems() async {
    try {
      isLoading(true);
      errorMessage('');
      final items = await apiService.fetchGalleryItems();
      galleryItems.assignAll(items);
    } catch (e) {
      errorMessage('Failed to load gallery items');
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
