class GalleryItem {
  final String id;
  final String name;
  final int docType;
  final int uid;
  final String url;

  GalleryItem({required this.id, required this.name, required this.docType, required this.uid, required this.url});

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['_id'],
      name: json['_name'],
      docType: json['_docType'],
      uid: json['_uid'],
      url: json['_url'],
    );
  }
}
