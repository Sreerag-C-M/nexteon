import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class GalleryPage extends StatelessWidget {
  final GalleryController controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name',)),
                DataColumn(label: Text('UID')),
                DataColumn(label: Text('DocType')),
                DataColumn(label: Text('Image')),
              ],
              rows: controller.galleryItems.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item.name)),
                  DataCell(Text(item.uid.toString())),
                  DataCell(Text(item.docType.toString())),
                  DataCell(Text(item.url)),
                ]);
              }).toList(),
            ),
          );
        }
      }),
    );
  }
}
