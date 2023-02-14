class StoresResponse {
  final StoresBody? body;
  final String? status;
  final String? message;

  StoresResponse({this.body, this.status, this.message});

  StoresResponse.fromJson(Map<String, dynamic> json)
      : body = json['body'] != null ? StoresBody.fromJson(json['body']) : null,
        message = json['message'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['body'] = body?.toJson();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class StoresBody {
  final List<Stores>? stores;
  final List<Categories>? categories;
  final List<Locations>? locations;
  final dynamic seoTag;

  StoresBody({this.stores, this.categories, this.locations, this.seoTag});

  StoresBody.fromJson(Map<String, dynamic> json)
      : stores = json['stores'] != null
            ? List.from(json['stores']).map((e) => Stores.fromJson(e)).toList()
            : null,
        categories = json['categories'] != null
            ? List.from(json['categories'])
                .map((e) => Categories.fromJson(e))
                .toList()
            : null,
        locations = json['locations'] != null
            ? List.from(json['locations'])
                .map((e) => Locations.fromJson(e))
                .toList()
            : null,
        seoTag = json['seo_tag'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['stores'] = stores?.map((v) => v.toJson()).toList();
    data['categories'] = categories?.map((v) => v.toJson()).toList();
    data['locations'] = locations?.map((v) => v.toJson()).toList();
    data['seo_tag'] = seoTag;
    return data;
  }
}

class Stores {
  final String? id;
  final String? categoryId;
  final String? subcategoryId;
  final String? userId;
  final String? title;
  final String? description;
  final String? floor;
  final String? logo;
  final String? coverImage;
  final String? address;
  final String? location;
  // final List<String?>? gallery;
  final dynamic gallery;
  final String? fbUrl;
  final String? twitterUrl;
  final String? linkedinUrl;
  final String? instaUrl;
  final String? weekdayOpening;
  final String? weekdayClosing;
  final String? weekendOpening;
  final String? weekendClosing;
  final String? map;
  final String? createdAt;
  final String? updatedAt;
  final String? telephoneNumber;
  final String? slug;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeyword;
  final String? titleAr;
  final String? descriptionAr;
  final String? addressAr;
  final String? mapAr;
  final String? categoryName;
  final String? subcategoryName;
  final String? locName;

  Stores(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.userId,
      this.title,
      this.description,
      this.floor,
      this.logo,
      this.coverImage,
      this.address,
      this.location,
      this.gallery,
      this.fbUrl,
      this.twitterUrl,
      this.linkedinUrl,
      this.instaUrl,
      this.weekdayOpening,
      this.weekdayClosing,
      this.weekendOpening,
      this.weekendClosing,
      this.map,
      this.createdAt,
      this.updatedAt,
      this.telephoneNumber,
      this.slug,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.titleAr,
      this.descriptionAr,
      this.addressAr,
      this.mapAr,
      this.categoryName,
      this.subcategoryName,
      this.locName});

  Stores.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        categoryId = json['category_id'],
        subcategoryId = json['subcategory_id'],
        userId = json['user_id'],
        title = json['title'],
        description = json['description'],
        floor = json['floor'],
        logo = json['logo'],
        coverImage = json['cover_image'],
        address = json['address'],
        location = json['location'],
        gallery = json['gallery'],
        // gallery = json['gallery'] != null ? List<String>.from(json['gallery'])
        //         .map((e) => e)
        //         .toList() : null,
        fbUrl = json['fb_url'],
        twitterUrl = json['twitter_url'],
        linkedinUrl = json['linkedin_url'],
        instaUrl = json['insta_url'],
        weekdayOpening = json['weekday_opening'],
        weekdayClosing = json['weekday_closing'],
        weekendOpening = json['weekend_opening'],
        weekendClosing = json['weekend_closing'],
        map = json['map'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        telephoneNumber = json['telephone_number'],
        slug = json['slug'],
        seoTitle = json['seo_title'],
        seoDescription = json['seo_description'],
        seoKeyword = json['seo_keyword'],
        titleAr = json['title_ar'],
        descriptionAr = json['description_ar'],
        addressAr = json['address_ar'],
        mapAr = json['map_ar'],
        categoryName = json['category_name'],
        subcategoryName = json['subcategory_name'],
        locName = json['loc_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['floor'] = floor;
    data['logo'] = logo;
    data['cover_image'] = coverImage;
    data['address'] = address;
    data['location'] = location;
    data['gallery'] = gallery;
    data['fb_url'] = fbUrl;
    data['twitter_url'] = twitterUrl;
    data['linkedin_url'] = linkedinUrl;
    data['insta_url'] = instaUrl;
    data['weekday_opening'] = weekdayOpening;
    data['weekday_closing'] = weekdayClosing;
    data['weekend_opening'] = weekendOpening;
    data['weekend_closing'] = weekendClosing;
    data['map'] = map;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['telephone_number'] = telephoneNumber;
    data['slug'] = slug;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_keyword'] = seoKeyword;
    data['title_ar'] = titleAr;
    data['description_ar'] = descriptionAr;
    data['address_ar'] = addressAr;
    data['map_ar'] = mapAr;
    data['category_name'] = categoryName;
    data['subcategory_name'] = subcategoryName;
    data['loc_name'] = locName;
    return data;
  }
}

class Categories {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final String? nameAr;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.nameAr});

  Categories.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slug = json['slug'],
        image = json['image'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        nameAr = json['name_ar'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name_ar'] = nameAr;
    return data;
  }
}

class Locations {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final String? slug;
  final String? nameAr;

  Locations(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.nameAr});

  Locations.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        slug = json['slug'],
        nameAr = json['name_ar'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    data['name_ar'] = nameAr;
    return data;
  }
}
