import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteon/screen/home.dart';
import 'package:nexteon/service/serviceres.dart';

import 'controller/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(GalleryController());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => GalleryPage());
          },
          child: Text('Gallery'),
        ),
      ),
    );
  }
}
