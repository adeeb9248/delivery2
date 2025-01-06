import 'package:flutter/material.dart';
import 'products_screen.dart';

class StoresScreen extends StatelessWidget {
  final String categoryName;

  StoresScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName Stores'),
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
                  hintText: 'Search stores',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // List of Stores
            Expanded(
              child: ListView(
                children: [
                  _buildStoreCard(
                    context,
                    'Fresh Vegetables Store',
                    'https://via.placeholder.com/150',
                  ),
                  _buildStoreCard(
                    context,
                    'Organic Farm Market',
                    'https://via.placeholder.com/150',
                  ),
                  _buildStoreCard(
                    context,
                    'Greenhouse Produce',
                    'https://via.placeholder.com/150',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreCard(BuildContext context, String storeName, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to ProductsScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductsScreen(storeName: storeName),
            ),
          );
        },
        child: Container(
          height: 120,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Placeholder Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              // Store Name
              Expanded(
                child: Text(
                  storeName,
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
