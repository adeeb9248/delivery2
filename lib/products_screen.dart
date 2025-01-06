import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String storeName;

  ProductsScreen({required this.storeName});

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Boston Lettuce',
      'image': 'https://www.thespruceeats.com/thmb/xna3brlTYvIfpbzwrqhoHKzHKn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-butter-lettuce-4773670-hero-06-0b9d54128b3e48e081015e17b5764c39.jpg',
      'price': '1.10 €/piece',
      'description': 'Fresh Boston Lettuce, perfect for your salads!',
    },
    {
      'name': 'Purple Cauliflower',
      'image': 'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
      'price': '1.85 €/kg',
      'description': 'Exotic purple cauliflower, rich in antioxidants.',
    },
    {
      'name': 'Savoy Cabbage',
      'image': 'https://media-cdn2.greatbritishchefs.com/media/yrkhs1dh/img12504.whqc_1426x713q80.jpg',
      'price': '1.45 €/kg',
      'description': 'Crunchy savoy cabbage, ideal for your recipes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$storeName Products'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // List of Products
            Expanded(
              child: ListView(
                children: products.map((product) {
                  return _buildProductCard(context, product);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to ProductDetailsScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Container(
          height: 120,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              // Product Name
              Expanded(
                child: Text(
                  product['name'],
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
