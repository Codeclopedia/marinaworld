import 'stores_response.dart';

class HomeResponse {
  final HomeBody? body;
  final String? status;
  final String? message;

  HomeResponse({this.body, this.status, this.message});

  HomeResponse.fromJson(Map<String, dynamic> json)
      : body = HomeBody?.fromJson(json['body']),
        status = json['status'],
        message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['body'] = body?.toJson();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class HomeBody {
  final List<Categories>? categories;
  final List<Stores>? stores;
  final List<Stores>? dinings;
  final List<Events>? events;
  final List<Offers>? offers;

  HomeBody.empty()
      : categories = [],
        stores = [],
        dinings = [],
        events = [],
        offers = [];

  HomeBody(
      {this.stores, this.dinings, this.categories, this.events, this.offers});

  HomeBody.fromJson(Map<String, dynamic> json)
      : stores =
            List.from(json['stores']).map((e) => Stores.fromJson(e)).toList(),
        dinings =
            List.from(json['dinings']).map((e) => Stores.fromJson(e)).toList(),
        categories = List.from(json['categories'])
            .map((e) => Categories.fromJson(e))
            .toList(),
        events =
            List.from(json['events']).map((e) => Events.fromJson(e)).toList(),
        offers =
            List.from(json['offers']).map((e) => Offers.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['stores'] = stores?.map((v) => v.toJson()).toList();
    data['dinings'] = dinings?.map((v) => v.toJson()).toList();
    data['categories'] = categories?.map((v) => v.toJson()).toList();
    data['events'] = events?.map((v) => v.toJson()).toList();
    data['offers'] = offers?.map((v) => v.toJson()).toList();

    return data;
  }
}

class Events {
  final String? id;
  final String? userId;
  final String? title;
  final String? description;
  final String? ftImg;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeyword;
  final String? titleAr;
  final String? descriptionAr;

  Events(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.ftImg,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.titleAr,
      this.descriptionAr});

  Events.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        title = json['title'],
        description = json['description'],
        ftImg = json['ft_img'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        slug = json['slug'],
        seoTitle = json['seo_title'],
        seoDescription = json['seo_description'],
        seoKeyword = json['seo_keyword'],
        titleAr = json['title_ar'],
        descriptionAr = json['description_ar'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['ft_img'] = ftImg;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_keyword'] = seoKeyword;
    data['title_ar'] = titleAr;
    data['description_ar'] = descriptionAr;
    return data;
  }
}

class Offers {
  final String? id;
  final String? userId;
  final String? title;
  final String? description;
  final String? ftImg;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeyword;
  final String? titleAr;
  final String? descriptionAr;

  Offers(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.ftImg,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.titleAr,
      this.descriptionAr});

  Offers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['user_id'],
        title = json['title'],
        description = json['description'],
        ftImg = json['ft_img'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        slug = json['slug'],
        seoTitle = json['seo_title'],
        seoDescription = json['seo_description'],
        seoKeyword = json['seo_keyword'],
        titleAr = json['title_ar'],
        descriptionAr = json['description_ar'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['ft_img'] = ftImg;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_keyword'] = seoKeyword;
    data['title_ar'] = titleAr;
    data['description_ar'] = descriptionAr;
    return data;
  }
}
