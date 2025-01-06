import 'package:delivery2/models/product.dart';
import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'product_details_screen.dart';

class VegetablesScreen extends StatelessWidget {

  final List<Product> vegetables = [
    Product(
      id: 1,
      name: 'Boston Lettuce',
      price: '1.10 €/piece',
      description: 'Fresh Boston Lettuce, perfect for your salads!',
      storeId: 0,
      image:
          'https://www.thespruceeats.com/thmb/xna3brlTYvIfpbzwrqhoHKzHKn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-butter-lettuce-4773670-hero-06-0b9d54128b3e48e081015e17b5764c39.jpg',
      quantity: 10,
    ),
    Product(
      id: 2,
      name: 'Purple Cauliflower',
      price: '1.85 €/kg',
      description: 'Exotic purple cauliflower, rich in antioxidants.',
      storeId: 0,
      image: 'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
      quantity: 10,
    ),
    Product(
      id: 3,
      name: 'Savoy Cabbage',
      price: '1.45 €/kg',
      description: 'Crunchy savoy cabbage, ideal for your recipes.',
      storeId: 0,
      image:
          'https://media-cdn2.greatbritishchefs.com/media/yrkhs1dh/img12504.whqc_1426x713q80.jpg',
      quantity: 10,
    )
  ];

  VegetablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Category Images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryImage(context, 'Cabbage and Lettuce'),
                  _buildCategoryImage(context, 'Cucumbers and Tomatoes'),
                  _buildCategoryImage(context, 'Onions and Garlic'),
                  _buildCategoryImage(context, 'Peppers'),
                  _buildCategoryImage(context, 'Potatoes and Carrots'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Top Products Text
            const Text(
              'Top Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10),
            // Top 3 Vegetables
            Expanded(
              child: ListView.builder(
                itemCount: vegetables.length,
                itemBuilder: (context, index) {
                  return _buildVegetableCard(context, vegetables[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }

  Widget _buildCategoryImage(BuildContext context, String categoryName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to the corresponding store screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsScreen(storeName: categoryName),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              'https://via.placeholder.com/120', // Placeholder image for category
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(categoryName,
                style: const TextStyle(fontSize: 14, color: Colors.purple)),
          ],
        ),
      ),
    );
  }

  Widget _buildVegetableCard(
      BuildContext context, Product vegetable) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to ProductDetailsScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: vegetable),
            ),
          );
        },
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  vegetable.image ?? 'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Product Name
              Expanded(
                child: Text(
                  vegetable.name ?? 'Product Name',
                  style: const TextStyle(
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
