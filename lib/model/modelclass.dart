class GalleryItem {
  String id;
  String name;
  String? globalGalleryCategoryId;
  int docType;
  int uid;
  int type;
  String url;
  String createdUserId;
  int createdAt;
  String? updatedUserId;
  int updatedAt;
  int status;
  int v;

  GalleryItem({
    required this.id,
    required this.name,
    this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    required this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  // Factory method to map JSON data to GalleryItem object
  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['_id'],
      name: json['_name'],
      globalGalleryCategoryId: json['_globalGalleryCategoryId'],
      docType: json['_docType'],
      uid: json['_uid'],
      type: json['_type'],
      url: json['_url'],
      createdUserId: json['_createdUserId'],
      createdAt: json['_createdAt'],
      updatedUserId: json['_updatedUserId'],
      updatedAt: json['_updatedAt'],
      status: json['_status'],
      v: json['__v'],
    );
  }

  // Optional: Convert GalleryItem object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      '_name': name,
      '_globalGalleryCategoryId': globalGalleryCategoryId,
      '_docType': docType,
      '_uid': uid,
      '_type': type,
      '_url': url,
      '_createdUserId': createdUserId,
      '_createdAt': createdAt,
      '_updatedUserId': updatedUserId,
      '_updatedAt': updatedAt,
      '_status': status,
      '__v': v,
    };
  }

  // Method to get the docType description
  String getDocTypeDescription() {
    switch (docType) {
      case 0:
        return 'Image';
      case 1:
        return 'Video';
      case 2:
        return 'PDF';
      case 3:
        return 'Audio';
      case 4:
        return 'Document';
      default:
        return 'Unknown';
    }
  }
}


class GalleryResponse {
  String message;
  List<GalleryItem> list;
  int totalCount;

  GalleryResponse({
    required this.message,
    required this.list,
    required this.totalCount,
  });

  // Factory method to map JSON data to GalleryResponse object
  factory GalleryResponse.fromJson(Map<String, dynamic> json) {
    var listData = json['data']['list'] as List;
    List<GalleryItem> galleryList =
    listData.map((item) => GalleryItem.fromJson(item)).toList();

    return GalleryResponse(
      message: json['message'],
      list: galleryList,
      totalCount: json['data']['totalCount'],
    );
  }
}
