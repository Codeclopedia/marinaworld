class GalleryResponse {
  List<GalleryItem>? body;
  String? status;
  String? message;

  GalleryResponse({this.body, this.status, this.message});

  GalleryResponse.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <GalleryItem>[];
      json['body'].forEach((v) {
        body!.add(GalleryItem.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class GalleryItem {
  String? id;
  String? category;
  String? media;
  String? createdAt;
  String? updatedAt;
  String? catName;

  GalleryItem(
      {this.id,
      this.category,
      this.media,
      this.createdAt,
      this.updatedAt,
      this.catName});

  GalleryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    media = json['media'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['media'] = media;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cat_name'] = catName;
    return data;
  }
}
