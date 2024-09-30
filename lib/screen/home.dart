import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
          return Center(
            child: SpinKitFadingCircle(
              color: Colors.blue,
              size: 50.0,
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                decoration: BoxDecoration(color: Colors.grey.shade100),
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('UID')),
                  DataColumn(label: Text('DocType')),
                  DataColumn(label: Text('Image')),
                ],
                rows: controller.errorMessage.isNotEmpty
                    ? [
                  DataRow(cells: [
                    DataCell(
                      Text(
                        'Failed to load',
                        style: TextStyle(color: Colors.red),
                      ),
                      placeholder: true,
                      showEditIcon: false,
                    ),
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ])
                ]
                    : controller.galleryItems.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item.name)),
                    DataCell(Text(item.uid.toString())),
                    DataCell(Text(item.docType.toString())),
                    DataCell(Text(item.url)),
                  ]);
                }).toList(),
              ),
            ),
          );
        }
      }),
    );
  }
}
