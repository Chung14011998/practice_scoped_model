class ProductResponse {
  List<Categories> categories;

  ProductResponse({this.categories});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String name;
  List<Level3> level3;

  Categories({this.name, this.level3});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['level3'] != null) {
      level3 = new List<Level3>();
      json['level3'].forEach((v) {
        level3.add(new Level3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.level3 != null) {
      data['level3'] = this.level3.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Level3 {
  String name;
  String id;
  List<Products> products;

  Level3({this.name, this.id, this.products});

  Level3.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String name;
  String sku;
  String id;
  String imgUrl;
  String smallImage;
  String urlKey;
  String status;
  String visibility;
  String typeId;
  String price;

  Products(
      {this.name,
        this.sku,
        this.id,
        this.imgUrl,
        this.smallImage,
        this.urlKey,
        this.status,
        this.visibility,
        this.typeId,
        this.price});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sku = json['sku'];
    id = json['id'];
    imgUrl = json['imgUrl'];
    smallImage = json['smallImage'];
    urlKey = json['urlKey'];
    status = json['status'];
    visibility = json['visibility'];
    typeId = json['type_id'];
    price = json['price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['smallImage'] = this.smallImage;
    data['urlKey'] = this.urlKey;
    data['status'] = this.status;
    data['visibility'] = this.visibility;
    data['type_id'] = this.typeId;
    data['price'] = this.price;
    return data;
  }
}