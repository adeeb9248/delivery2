import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  product['image'],
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Product Name
            Text(
              product['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 8),
            // Product Price
            Text(
              product['price'],
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            // Product Description
            Text(
              product['description'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            Spacer(),
            // Add to Cart Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    // Add to Cart Logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added ${product['name']} to cart')),
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
