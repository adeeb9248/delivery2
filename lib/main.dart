import 'package:delivery2/providers/product_details_provider.dart';
import 'package:delivery2/providers/products_provider.dart';
import 'package:delivery2/providers/stores_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vegetables_screen.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => StoresProvider()),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetable Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: VegetablesScreen(), // Call the VegetablesScreen here
    );
  }
}
