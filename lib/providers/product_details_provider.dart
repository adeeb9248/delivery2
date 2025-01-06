

import 'package:delivery2/helper/api.dart';
import 'package:delivery2/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  Product? product;

  getProductDetailsAsync(int productId) async {
    var data = await Api().get(url: '/product/$productId', token: null);

    product = Product.fromJson(data);

    notifyListeners();
  }
}