import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/modelclass.dart';

class ApiService extends GetConnect {
  final String _authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNzc2MzIzMywiZXhwIjoxNzU5Mjk5MjMzfQ.aU6MGEdhB7m-N06OF4ni2eGfB74ZfPq7zBfRiMW04o8";


  Future<List<GalleryItem>> fetchGalleryItems() async {
    const url = 'https://ajcjewel.com:4000/api/global-gallery/list';
    final headers = {
      'Authorization': _authToken,
    };
    final data = {
      "statusArray": [1],
      "screenType": [],
      "responseFormat": [],
      "globalGalleryIds": [],
      "categoryIds": [],
      "docTypes": [],
      "types": [],
      "limit": 10,
      "skip": 0,
      "searchingText": ""
    };

    try {
      final response = await post(url, data, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> list = response.body['data']['list'];
        return list.map((json) => GalleryItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load gallery items');
      }
    } on DioError catch (e) {
      print('DioError: ${e.message}');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
        print('Response headers: ${e.response?.headers}');
        print('Response status code: ${e.response?.statusCode}');
      } else {
        print('Error sending request!');
      }
      throw Exception('Failed to load gallery items: ${e.message}');
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load gallery items');
    }
  }
}
