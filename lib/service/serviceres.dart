import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/modelclass.dart';

class ApiService extends GetxService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNzc2MzIzMywiZXhwIjoxNzU5Mjk5MjMzfQ.aU6MGEdhB7m-N06OF4ni2eGfB74ZfPq7zBfRiMW04o8';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("Response data: ${response.data}");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('Error: ${e.response?.data ?? e.message}');
        return handler.next(e);
      },
    ));
  }

  Future<GalleryResponse> fetchGalleryItems() async {
    final payload = {
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
      final response = await _dio.post('https://ajcjewel.com:4000/api/global-gallery/list', data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response data::: ${response.data}');
        return GalleryResponse.fromJson(response.data);

      }
      else {
        // Handle non-200 status codes
        throw('Error: ${response!.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
