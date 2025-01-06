class Store {
  int? id;
  String? name;
  int? categoryId;
  String? image;

  Store(
      {this.id,
      this.name,
      this.categoryId,
      this.image,
      });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    return data;
  }
}

class Stores {
  List<Store>? list_of_store;

  Stores({this.list_of_store});

  Stores.fromJson(List<dynamic> jsonList) {
    list_of_store = <Store>[];
    jsonList.forEach((v) {
      list_of_store!.add(new Store.fromJson(v));
    });
  }

  List<Map<String, dynamic>> toJson() {
    return list_of_store.map((v) => v.toJson()).toList();
  }
}

