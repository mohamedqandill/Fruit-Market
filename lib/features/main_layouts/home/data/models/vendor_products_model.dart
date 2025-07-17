class VendorProductsModel {
  VendorProductsModel({
    this.status,
    this.data,
  });

  VendorProductsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductData.fromJson(v));
      });
    }
  }
  bool? status;
  List<ProductData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.vendorId,
    this.nameEn,
    this.discount,
    this.categoryId,
    this.quantity,
    this.price,
    this.img,
    this.details,
    this.detailsEn,
    this.unit,
    this.unitEn,
    this.nameCategory,
    this.nameCategoryEn,
    this.priceAfterDiscount,
    this.isFavorite,
    this.productAttributesValues,
    this.subUnits,
  });

  ProductData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    vendorId = json['vendor_id'];
    nameEn = json['name_en'];

    categoryId = json['category_id'];
    quantity = json['quantity'];

    img = json['img'];
    details = json['details'];
    detailsEn = json['details_en'];
    unit = json['unit'];
    unitEn = json['unit_en'];
    nameCategory = json['name_category'];
    nameCategoryEn = json['name_category_en'];

    discount =
        json['discount'] != null ? (json['discount'] as num).toDouble() : null;
    price = json['price'] != null ? (json['price'] as num).toDouble() : null;
    priceAfterDiscount = json['price_after_discount'] != null
        ? (json['price_after_discount'] as num).toDouble()
        : null;

    isFavorite = json['is_favorite'];

    if (json['sub_units'] != null) {
      subUnits = [];
      json['sub_units'].forEach((v) {
        subUnits?.add(SubUnits.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  int? vendorId;
  String? nameEn;
  double? discount;
  int? categoryId;
  int? quantity;
  double? price;
  String? img;
  String? details;
  String? detailsEn;
  String? unit;
  String? unitEn;
  String? nameCategory;
  String? nameCategoryEn;

  double? priceAfterDiscount;
  int? isFavorite;
  List<dynamic>? productAttributesValues;
  List<SubUnits>? subUnits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['vendor_id'] = vendorId;
    map['name_en'] = nameEn;
    map['discount'] = discount;
    map['category_id'] = categoryId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['img'] = img;
    map['details'] = details;
    map['details_en'] = detailsEn;
    map['unit'] = unit;
    map['unit_en'] = unitEn;
    map['name_category'] = nameCategory;
    map['name_category_en'] = nameCategoryEn;
    map['price_after_discount'] = priceAfterDiscount;
    map['is_favorite'] = isFavorite;
    if (productAttributesValues != null) {
      map['product_attributes_values'] =
          productAttributesValues?.map((v) => v.toJson()).toList();
    }
    if (subUnits != null) {
      map['sub_units'] = subUnits?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SubUnits {
  SubUnits({
    this.id,
    this.productId,
    this.unitId,
    this.subUnit,
    this.subUnitEn,
    this.subQuantity,
    this.subPrice,
    this.subDiscount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  SubUnits.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    unitId = json['unit_id'];
    subUnit = json['sub_unit'];
    subUnitEn = json['sub_unit_en'];
    subQuantity = json['sub_quantity'];
    subPrice = json['sub_price'] != null
        ? (json['sub_price'] as num).toDouble()
        : null;
    subDiscount = json['sub_discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  int? productId;
  int? unitId;
  String? subUnit;
  String? subUnitEn;
  int? subQuantity;
  double? subPrice;
  String? subDiscount;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['unit_id'] = unitId;
    map['sub_unit'] = subUnit;
    map['sub_unit_en'] = subUnitEn;
    map['sub_quantity'] = subQuantity;
    map['sub_price'] = subPrice;
    map['sub_discount'] = subDiscount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
