class Product {
  int? id;
  String? name;
  String? price;
  String? description;
  int? storeId;
  String? image;
  int? quantity;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.storeId,
      this.image,
      this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    storeId = json['store_id'];
    image = json['image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['store_id'] = this.storeId;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Products {
  List<Product>? list_of_product;

  products({this.list_of_product});

  products.fromJson(List<dynamic> jsonList) {
    list_of_product = <Product>[];
    jsonList.forEach((v) {
      list_of_product!.add(new Product.fromJson(v));
    });
  }
  
  List<Map<String, dynamic>> toJson() {
    return list_of_product.map((v) => v.toJson()).toList();
  }
}