// To parse this JSON data, do
//
//     final exampleModel = exampleModelFromJson(jsonString);

import 'dart:convert';

ExampleModel exampleModelFromJson(String str) => ExampleModel.fromJson(json.decode(str));

String exampleModelToJson(ExampleModel data) => json.encode(data.toJson());

class ExampleModel {
  ExampleModel({
    this.status,
    this.categories,
    this.start,
    this.page,
    this.totalItem,
    this.totalPages,
    this.itemsPerPage,
    this.listItems,
    this.customFields,
    this.message,
  });

  int ?status;
  List<Category> ?categories;
  int ?start;
  int ?page;
  String ?totalItem;
  int ?totalPages;
  String ?itemsPerPage;
  List<ListItem> ?listItems;
  List<CustomField> ?customFields;
  List<dynamic> ?message;

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
    status: json["status"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    start: json["start"],
    page: json["page"],
    totalItem: json["totalItem"],
    totalPages: json["totalPages"],
    itemsPerPage: json["items_per_page"],
    listItems: List<ListItem>.from(json["list_items"].map((x) => ListItem.fromJson(x))),
    customFields: List<CustomField>.from(json["custom_fields"].map((x) => CustomField.fromJson(x))),
    message: List<dynamic>.from(json["message"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "start": start,
    "page": page,
    "totalItem": totalItem,
    "totalPages": totalPages,
    "items_per_page": itemsPerPage,
    "list_items": List<dynamic>.from(listItems!.map((x) => x.toJson())),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x.toJson())),
    "message": List<dynamic>.from(message!.map((x) => x)),
  };
}

class Category {
  Category({
    this.catId,
    this.catName,
    this.catPlural,
    this.catSlug,
    this.catIcon,
    this.catOrder,
    this.catBg,
    this.catLink,
  });

  String ?catId;
  String ?catName;
  String ?catPlural;
  String ?catSlug;
  String ?catIcon;
  String ?catOrder;
  CatBg ?catBg;
  String ?catLink;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catId: json["cat_id"],
    catName: json["cat_name"],
    catPlural: json["cat_plural"],
    catSlug: json["cat_slug"],
    catIcon: json["cat_icon"],
    catOrder: json["cat_order"],
    catBg: catBgValues.map![json["cat_bg"]],
    catLink: json["cat_link"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "cat_plural": catPlural,
    "cat_slug": catSlug,
    "cat_icon": catIcon,
    "cat_order": catOrder,
    "cat_bg": catBgValues.reverse![catBg],
    "cat_link": catLink,
  };
}

enum CatBg { EMPTY, RED }

final catBgValues = EnumValues({
  "": CatBg.EMPTY,
  "red": CatBg.RED
});

class CustomField {
  CustomField({
    this.fieldId,
    this.fieldName,
    this.fieldType,
  });

  int ?fieldId;
  String ?fieldName;
  FieldType ?fieldType;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
    fieldId: json["field_id"],
    fieldName: json["field_name"],
    fieldType: fieldTypeValues.map![json["field_type"]],
  );

  Map<String, dynamic> toJson() => {
    "field_id": fieldId,
    "field_name": fieldName,
    "field_type": fieldTypeValues.reverse![fieldType],
  };
}

enum FieldType { SELECT, TEXT, CHECKBOX }

final fieldTypeValues = EnumValues({
  "checkbox": FieldType.CHECKBOX,
  "select": FieldType.SELECT,
  "text": FieldType.TEXT
});

class ListItem {
  ListItem({
    this.listingId,
    this.address,
    this.areaCode,
    this.catName,
    this.catSlug,
    this.cityName,
    this.citySlug,
    this.countryAbbr,
    this.countryCall,
    this.countryName,
    this.isFeat,
    this.lat,
    this.listingLink,
    this.listingSlug,
    this.listingTitle,
    this.lng,
    this.mainPicUrl,
    this.phone,
    this.postalCode,
    this.price,
    this.rating,
    this.shortDesc,
    this.stateAbbr,
    this.stateSlug,
    this.tipText,
    this.mainCatId,
    this.mainCatSlug,
    this.wanted,
    this.listType,
    this.priceNegotiable,
    this.submissionDate,
    this.totalView,
    this.photos,
    this.customFields,
  });

  String ?listingId;
  String ?address;
  String ?areaCode;
  String ?catName;
  String ?catSlug;
  String ?cityName;
  String ?citySlug;
  CountryAbbr ?countryAbbr;
  String ?countryCall;
  CountryName ?countryName;
  String ?isFeat;
  String ?lat;
  String ?listingLink;
  String ?listingSlug;
  String ?listingTitle;
  String ?lng;
  String ?mainPicUrl;
  String ?phone;
  String ?postalCode;
  String ?price;
  String ?rating;
  String ?shortDesc;
  StateAbbr ?stateAbbr;
  StateSlug ?stateSlug;
  String ?tipText;
  String ?mainCatId;
  String ?mainCatSlug;
  String ?wanted;
  String ?listType;
  String ?priceNegotiable;
  String ?submissionDate;
  String ?totalView;
  List<String> ?photos;
  dynamic ?customFields;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
    listingId: json["listing_id"],
    address: json["address"],
    areaCode: json["area_code"],
    catName: json["cat_name"],
    catSlug: json["cat_slug"],
    cityName: json["city_name"],
    citySlug: json["city_slug"],
    countryAbbr: countryAbbrValues.map![json["country_abbr"]],
    countryCall: json["country_call"],
    countryName: countryNameValues.map![json["country_name"]],
    isFeat: json["is_feat"],
    lat: json["lat"],
    listingLink: json["listing_link"],
    listingSlug: json["listing_slug"],
    listingTitle: json["listing_title"],
    lng: json["lng"],
    mainPicUrl: json["main_pic_url"],
    phone: json["phone"],
    postalCode: json["postal_code"],
    price: json["price"],
    rating: json["rating"],
    shortDesc: json["short_desc"],
    stateAbbr: stateAbbrValues.map![json["state_abbr"]],
    stateSlug: stateSlugValues.map![json["state_slug"]],
    tipText: json["tip_text"] == null ? null : json["tip_text"],
    mainCatId: json["main_cat_id"],
    mainCatSlug: json["main_cat_slug"],
    wanted: json["wanted"],
    listType: json["list_type"],
    priceNegotiable: json["priceNegotiable"],
    submissionDate: json["submission_date"],
    totalView: json["total_view"],
    photos: List<String>.from(json["photos"].map((x) => x)),
    customFields: json["custom_fields"],
  );

  Map<String, dynamic> toJson() => {
    "listing_id": listingId,
    "address": address,
    "area_code": areaCode,
    "cat_name": catName,
    "cat_slug": catSlug,
    "city_name": cityName,
    "city_slug": citySlug,
    "country_abbr": countryAbbrValues.reverse![countryAbbr],
    "country_call": countryCall,
    "country_name": countryNameValues.reverse![countryName],
    "is_feat": isFeat,
    "lat": lat,
    "listing_link": listingLink,
    "listing_slug": listingSlug,
    "listing_title": listingTitle,
    "lng": lng,
    "main_pic_url": mainPicUrl,
    "phone": phone,
    "postal_code": postalCode,
    "price": price,
    "rating": rating,
    "short_desc": shortDesc,
    "state_abbr": stateAbbrValues.reverse![stateAbbr],
    "state_slug": stateSlugValues.reverse![stateSlug],
    "tip_text": tipText == null ? null : tipText,
    "main_cat_id": mainCatId,
    "main_cat_slug": mainCatSlug,
    "wanted": wanted,
    "list_type": listType,
    "priceNegotiable": priceNegotiable,
    "submission_date": submissionDate,
    "total_view": totalView,
    "photos": List<dynamic>.from(photos!.map((x) => x)),
    "custom_fields": customFields,
  };
}

enum CountryAbbr { SO }

final countryAbbrValues = EnumValues({
  "SO": CountryAbbr.SO
});

enum CountryName { SOMALILAND }

final countryNameValues = EnumValues({
  "Somaliland": CountryName.SOMALILAND
});

enum StateAbbr { BERBERA, HARGEISA }

final stateAbbrValues = EnumValues({
  "Berbera": StateAbbr.BERBERA,
  "Hargeisa": StateAbbr.HARGEISA
});

enum StateSlug { BERBERA, HARGEISA }

final stateSlugValues = EnumValues({
  "berbera": StateSlug.BERBERA,
  "hargeisa": StateSlug.HARGEISA
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
