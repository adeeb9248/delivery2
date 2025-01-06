

class ProductsProvider extends ChangeNotifier {
  final List<Product> _items = [];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  getProductsAsync(int storeId) {
    var data = Api().get(url: '/store/$storeId');

    var products = Products.fromJson(data);

    _items = products.list_of_product;
    notifyListeners();;
  }

  getTopProductsAsync() {
    var data = Api().get(url: '/products/top3');

    var products = Products.fromJson(data);

    _items = products.list_of_product;
    notifyListeners();
  }

  searchForProductAsync(String name) {
    var data = Api().post(url: '/products/search', body: {
      'name': $name
    });

    var products = Products.fromJson(data);

    _items = products.list_of_product;
    notifyListeners();
  }
}