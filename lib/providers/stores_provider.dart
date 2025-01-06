

class StoresProvider extends ChangeNotifier {
  final List<Store> _items = [];
  UnmodifiableListView<Store> get items => UnmodifiableListView(_items);

  ProductToSendList productToSendList = [];
  void add(int productId, int quantity) {
    productToSendList.add(new ProductToSend(productId.tostirng(), quantity.tostirng()));
  }

  void removeAll() {
    productToSendList.clear();
  }

  getAllStoresAsync() {
    var data = Api().get(url: '/stores');

    var stores = Stores.fromJson(data);

    _items = stores.list_of_store;
    notifyListeners();
  }

  getStoresByCategoryIdAsync(int categoryId) {
    var data = Api().get(url: '/category/$categoryId');

    var stores = Stores.fromJson(data);

    _items = stores.list_of_store;
    notifyListeners();
  }

  searchForStoreAsync(String name) {
    var data = Api().post(url: '/store/search', body: {
      'name': $name
    });

    var products = Stores.fromJson(data);

    _items = products.list_of_product;
    notifyListeners();
  }

  addPurchasesAsync() {
    var data = Api().post(url: '/Purchases/store', body: json.encode(productToSendList.toJson()));

    message = data as String;

    notifyListeners();
  }
}