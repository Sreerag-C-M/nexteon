import 'package:dio/dio.dart';

import '../model/modelclass.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://ajcjewel.com:4000/api',
    headers: {
      'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNjEyNTUzNCwiZXhwIjoxNzU3NjYxNTM0fQ.WtYYgVWtxVQlbwoIKddHcUGGAKRKMIJayaRHzqjtRU',
    },
  ));

  Future<List<GalleryItem>> fetchGalleryItems() async {
    try {
      final response = await _dio.post('/global-gallery/list', data: {
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
      });
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data']['list'];
        return data.map((item) => GalleryItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load gallery items: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception('Failed to load gallery items: ${e.response?.data}');
      } else {
        throw Exception('Failed to load gallery items: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load gallery items: $e');
    }
  }
}
