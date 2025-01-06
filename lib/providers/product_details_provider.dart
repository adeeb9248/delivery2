

class ProductDetailsProvider extends ChangeNotifier {
  Product? product;

  getProductDetailsAsync(int productId) {
    var data = Api().get(url: '/product/$productId');

    product = Product.fromJson(data);

    notifyListeners();
  }
}