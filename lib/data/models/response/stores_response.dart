import 'dart:convert';

// To parse this JSON data, do
//
//     final storesResponse = storesResponseFromJson(jsonString);

class StoresResponse {
  StoresResponse({
    this.body,
    this.status,
  });

  StoresBody? body;
  String? status;

  factory StoresResponse.fromRawJson(String str) =>
      StoresResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoresResponse.fromJson(Map<String, dynamic> json) => StoresResponse(
        body: StoresBody.fromJson(json["body"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "body": body?.toJson(),
        "status": status,
      };
}

class StoresBody {
  StoresBody({
    this.stores,
    this.categories,
    this.locations,
    this.seoTag,
  });

  List<Stores>? stores;
  List<Categories>? categories;
  List<Locations>? locations;
  dynamic seoTag;

  factory StoresBody.fromRawJson(String str) =>
      StoresBody.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoresBody.fromJson(Map<String, dynamic> json) => StoresBody(
        stores:
            List<Stores>.from(json["stores"].map((x) => Stores.fromJson(x))),
        categories: List<Categories>.from(
            json["categories"].map((x) => Categories.fromJson(x)) ?? []),
        locations: List<Locations>.from(
            json["locations"].map((x) => Locations.fromJson(x)) ?? []),
        seoTag: json["seo_tag"],
      );

  Map<String, dynamic> toJson() => {
        "stores": List<dynamic>.from(stores?.map((x) => x.toJson()) ?? []),
        "categories":
            List<dynamic>.from(categories?.map((x) => x.toJson()) ?? []),
        "locations":
            List<dynamic>.from(locations?.map((x) => x.toJson()) ?? []),
        "seo_tag": seoTag,
      };
}

class Categories {
  Categories({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.nameAr,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nameAr;

  factory Categories.fromRawJson(String str) =>
      Categories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nameAr: json["name_ar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name_ar": nameAr,
      };
}

class Stores {
  Stores({
    this.id,
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
    this.locName,
    this.wishlistInfo,
  });

  String? id;
  String? categoryId;
  String? subcategoryId;
  String? userId;
  String? title;
  String? description;
  String? floor;
  String? logo;
  String? coverImage;
  String? address;
  String? location;
  String? gallery;
  dynamic fbUrl;
  dynamic twitterUrl;
  dynamic linkedinUrl;
  dynamic instaUrl;
  String? weekdayOpening;
  String? weekdayClosing;
  String? weekendOpening;
  String? weekendClosing;
  String? map;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? telephoneNumber;
  String? slug;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  String? titleAr;
  String? descriptionAr;
  String? addressAr;
  String? mapAr;
  String? categoryName;
  String? subcategoryName;
  String? locName;
  List<WishlistInfo>? wishlistInfo;

  factory Stores.fromRawJson(String str) => Stores.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stores.fromJson(Map<String, dynamic> json) => Stores(
        id: json["id"].toString(),
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        floor: json["floor"],
        logo: json["logo"],
        coverImage: json["cover_image"],
        address: json["address"],
        location: json["location"],
        gallery: json["gallery"],
        fbUrl: json["fb_url"],
        twitterUrl: json["twitter_url"],
        linkedinUrl: json["linkedin_url"],
        instaUrl: json["insta_url"],
        weekdayOpening: json["weekday_opening"],
        weekdayClosing: json["weekday_closing"],
        weekendOpening: json["weekend_opening"],
        weekendClosing: json["weekend_closing"],
        map: json["map"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        telephoneNumber: json["telephone_number"],
        slug: json["slug"],
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        seoKeyword: json["seo_keyword"],
        titleAr: json["title_ar"],
        descriptionAr: json["description_ar"],
        addressAr: json["address_ar"],
        mapAr: json["map_ar"],
        categoryName: json["category_name"],
        subcategoryName: json["subcategory_name"],
        locName: json["loc_name"],
        wishlistInfo: List<WishlistInfo>.from(
            json["wishlist_info"].map((x) => WishlistInfo.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "user_id": userId,
        "title": title,
        "description": description,
        "floor": floor,
        "logo": logo,
        "cover_image": coverImage,
        "address": address,
        "location": location,
        "gallery": gallery,
        "fb_url": fbUrl,
        "twitter_url": twitterUrl,
        "linkedin_url": linkedinUrl,
        "insta_url": instaUrl,
        "weekday_opening": weekdayOpening,
        "weekday_closing": weekdayClosing,
        "weekend_opening": weekendOpening,
        "weekend_closing": weekendClosing,
        "map": map,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "telephone_number": telephoneNumber,
        "slug": slug,
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keyword": seoKeyword,
        "title_ar": titleAr,
        "description_ar": descriptionAr,
        "address_ar": addressAr,
        "map_ar": mapAr,
        "category_name": categoryName,
        "subcategory_name": subcategoryName,
        "loc_name": locName,
        "wishlist_info":
            List<dynamic>.from(wishlistInfo?.map((x) => x.toJson()) ?? []),
      };
}

// enum Address {
//   MARINA_MALL,
//   CRESCENT_MALL,
//   MARINA_WALK,
//   MARINA_WAVES,
//   MARINA_PLAZA,
//   MARINA_HOTEL,
//   MARINA_CRESCENT
// }

// final addressValues = EnumValues({
//   "Crescent Mall": Address.CRESCENT_MALL,
//   "Marina Crescent": Address.MARINA_CRESCENT,
//   "Marina Hotel": Address.MARINA_HOTEL,
//   "Marina Mall": Address.MARINA_MALL,
//   "Marina Plaza": Address.MARINA_PLAZA,
//   "Marina Walk": Address.MARINA_WALK,
//   "Marina Waves": Address.MARINA_WAVES
// });

// enum AddressAr { EMPTY, ADDRESS_AR, PURPLE, FLUFFY, TENTACLED, STICKY }

// final addressArValues = EnumValues({
//   "مارينا كريسنت": AddressAr.ADDRESS_AR,
//   "مارينا مول": AddressAr.EMPTY,
//   "مارينا ويفز": AddressAr.FLUFFY,
//   "مارينا واك": AddressAr.PURPLE,
//   "فندق المارينا": AddressAr.STICKY,
//   "مارينا بلازا": AddressAr.TENTACLED
// });

// enum CategoryName {
//   HEALTH,
//   SHOPPING,
//   BANKING,
//   COMMUNICATION,
//   ENTERTAINMENT,
//   TECHNOLOGY,
//   OFFICE,
//   HOTEL
// }

// final categoryNameValues = EnumValues({
//   "Banking": CategoryName.BANKING,
//   "Communication": CategoryName.COMMUNICATION,
//   "Entertainment": CategoryName.ENTERTAINMENT,
//   "Health": CategoryName.HEALTH,
//   "Hotel": CategoryName.HOTEL,
//   "Office": CategoryName.OFFICE,
//   "Shopping": CategoryName.SHOPPING,
//   "Technology": CategoryName.TECHNOLOGY
// });

// enum Floor { GROUND, THE_1_ST, THE_2_ND }

// final floorValues = EnumValues(
//     {"ground": Floor.GROUND, "1st": Floor.THE_1_ST, "2nd": Floor.THE_2_ND});

// enum WeekClosing { THE_1000_PM, THE_1200_AM, THE_1100_PM }

// final weekClosingValues = EnumValues({
//   "10:00 PM": WeekClosing.THE_1000_PM,
//   "11:00 PM": WeekClosing.THE_1100_PM,
//   "12:00 AM": WeekClosing.THE_1200_AM
// });

// enum WeekOpening { THE_1000_AM, THE_1200_PM, THE_0900_AM }

// final weekOpeningValues = EnumValues({
//   "09:00 AM": WeekOpening.THE_0900_AM,
//   "10:00 AM": WeekOpening.THE_1000_AM,
//   "12:00 PM": WeekOpening.THE_1200_PM
// });

class WishlistInfo {
  WishlistInfo({
    this.id,
    this.storeId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? storeId;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WishlistInfo.fromRawJson(String str) =>
      WishlistInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishlistInfo.fromJson(Map<String, dynamic> json) => WishlistInfo(
        id: json["id"],
        storeId: json["store_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
////
///
////
////
///
////
////
////
////
/////
///

// class StoresResponse {
//   final StoresBody? body;
//   final String? status;
//   final String? message;

//   StoresResponse({this.body, this.status, this.message});

//   StoresResponse.fromJson(Map<String, dynamic> json)
//       : body = json['body'] != null ? StoresBody.fromJson(json['body']) : null,
//         message = json['message'],
//         status = json['status'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['body'] = body?.toJson();
//     data['status'] = status;
//     data['message'] = message;
//     return data;
//   }
// }

// class StoresBody {
//   final List<Stores>? stores;
//   final List<Categories>? categories;
//   final List<Locations>? locations;
//   final dynamic seoTag;

//   StoresBody({this.stores, this.categories, this.locations, this.seoTag});

//   StoresBody.fromJson(Map<String, dynamic> json)
//       : stores = json['stores'] != null
//             ? List.from(json['stores']).map((e) => Stores.fromJson(e)).toList()
//             : null,
//         categories = json['categories'] != null
//             ? List.from(json['categories'])
//                 .map((e) => Categories.fromJson(e))
//                 .toList()
//             : null,
//         locations = json['locations'] != null
//             ? List.from(json['locations'])
//                 .map((e) => Locations.fromJson(e))
//                 .toList()
//             : null,
//         seoTag = json['seo_tag'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['stores'] = stores?.map((v) => v.toJson()).toList();
//     data['categories'] = categories?.map((v) => v.toJson()).toList();
//     data['locations'] = locations?.map((v) => v.toJson()).toList();
//     data['seo_tag'] = seoTag;
//     return data;
//   }
// }

// class Stores {
//   final String? id;
//   final String? categoryId;
//   final String? subcategoryId;
//   final String? userId;
//   final String? title;
//   final String? description;
//   final String? floor;
//   final String? logo;
//   final String? coverImage;
//   final String? address;
//   final String? location;
//   // final List<String?>? gallery;
//   final dynamic gallery;
//   final String? fbUrl;
//   final String? twitterUrl;
//   final String? linkedinUrl;
//   final String? instaUrl;
//   final String? weekdayOpening;
//   final String? weekdayClosing;
//   final String? weekendOpening;
//   final String? weekendClosing;
//   final String? map;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? telephoneNumber;
//   final String? slug;
//   final String? seoTitle;
//   final String? seoDescription;
//   final String? seoKeyword;
//   final String? titleAr;
//   final String? descriptionAr;
//   final String? addressAr;
//   final String? mapAr;
//   final String? categoryName;
//   final String? subcategoryName;
//   final String? locName;
//   final List<WishlistInfo>? wishlistInfo;

//   Stores({
//     this.id,
//     this.categoryId,
//     this.subcategoryId,
//     this.userId,
//     this.title,
//     this.description,
//     this.floor,
//     this.logo,
//     this.coverImage,
//     this.address,
//     this.location,
//     this.gallery,
//     this.fbUrl,
//     this.twitterUrl,
//     this.linkedinUrl,
//     this.instaUrl,
//     this.weekdayOpening,
//     this.weekdayClosing,
//     this.weekendOpening,
//     this.weekendClosing,
//     this.map,
//     this.createdAt,
//     this.updatedAt,
//     this.telephoneNumber,
//     this.slug,
//     this.seoTitle,
//     this.seoDescription,
//     this.seoKeyword,
//     this.titleAr,
//     this.descriptionAr,
//     this.addressAr,
//     this.mapAr,
//     this.categoryName,
//     this.subcategoryName,
//     this.locName,
//     this.wishlistInfo,
//   });

//   Stores.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         categoryId = json['category_id'],
//         subcategoryId = json['subcategory_id'],
//         userId = json['user_id'],
//         title = json['title'],
//         description = json['description'],
//         floor = json['floor'],
//         logo = json['logo'],
//         coverImage = json['cover_image'],
//         address = json['address'],
//         location = json['location'],
//         gallery = json['gallery'],
//         // gallery = json['gallery'] != null ? List<String>.from(json['gallery'])
//         //         .map((e) => e)
//         //         .toList() : null,
//         fbUrl = json['fb_url'],
//         twitterUrl = json['twitter_url'],
//         linkedinUrl = json['linkedin_url'],
//         instaUrl = json['insta_url'],
//         weekdayOpening = json['weekday_opening'],
//         weekdayClosing = json['weekday_closing'],
//         weekendOpening = json['weekend_opening'],
//         weekendClosing = json['weekend_closing'],
//         map = json['map'],
//         createdAt = json['created_at'],
//         updatedAt = json['updated_at'],
//         telephoneNumber = json['telephone_number'],
//         slug = json['slug'],
//         seoTitle = json['seo_title'],
//         seoDescription = json['seo_description'],
//         seoKeyword = json['seo_keyword'],
//         titleAr = json['title_ar'],
//         descriptionAr = json['description_ar'],
//         addressAr = json['address_ar'],
//         mapAr = json['map_ar'],
//         categoryName = json['category_name'],
//         subcategoryName = json['subcategory_name'],
//         locName = json['loc_name'],
//         wishlistInfo = json["wishlist_info"] == []
//             ? []
//             : List<WishlistInfo>.from(
//                 json["wishlist_info"].map((x) => WishlistInfo.fromJson(x)) ??
//                     []);

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['category_id'] = categoryId;
//     data['subcategory_id'] = subcategoryId;
//     data['user_id'] = userId;
//     data['title'] = title;
//     data['description'] = description;
//     data['floor'] = floor;
//     data['logo'] = logo;
//     data['cover_image'] = coverImage;
//     data['address'] = address;
//     data['location'] = location;
//     data['gallery'] = gallery;
//     data['fb_url'] = fbUrl;
//     data['twitter_url'] = twitterUrl;
//     data['linkedin_url'] = linkedinUrl;
//     data['insta_url'] = instaUrl;
//     data['weekday_opening'] = weekdayOpening;
//     data['weekday_closing'] = weekdayClosing;
//     data['weekend_opening'] = weekendOpening;
//     data['weekend_closing'] = weekendClosing;
//     data['map'] = map;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['telephone_number'] = telephoneNumber;
//     data['slug'] = slug;
//     data['seo_title'] = seoTitle;
//     data['seo_description'] = seoDescription;
//     data['seo_keyword'] = seoKeyword;
//     data['title_ar'] = titleAr;
//     data['description_ar'] = descriptionAr;
//     data['address_ar'] = addressAr;
//     data['map_ar'] = mapAr;
//     data['category_name'] = categoryName;
//     data['subcategory_name'] = subcategoryName;
//     data['loc_name'] = locName;
//     data["wishlist_info"] =
//         List<dynamic>.from(wishlistInfo?.map((x) => x.toJson()) ?? []);
//     return data;
//   }
// }

// class Categories {
//   final int? id;
//   final String? name;
//   final String? slug;
//   final String? image;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? nameAr;

//   Categories(
//       {this.id,
//       this.name,
//       this.slug,
//       this.image,
//       this.createdAt,
//       this.updatedAt,
//       this.nameAr});

//   Categories.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         name = json['name'],
//         slug = json['slug'],
//         image = json['image'],
//         createdAt = json['created_at'],
//         updatedAt = json['updated_at'],
//         nameAr = json['name_ar'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['name'] = name;
//     data['slug'] = slug;
//     data['image'] = image;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['name_ar'] = nameAr;
//     return data;
//   }
// }

// class WishlistInfo {
//   WishlistInfo({
//     this.id,
//     this.storeId,
//     this.userId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? storeId;
//   String? userId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory WishlistInfo.fromRawJson(String str) =>
//       WishlistInfo.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory WishlistInfo.fromJson(Map<String, dynamic> json) => WishlistInfo(
//         id: json["id"],
//         storeId: json["store_id"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "store_id": storeId,
//         "user_id": userId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

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
