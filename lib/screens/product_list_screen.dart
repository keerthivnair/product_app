import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_details_screen.dart';
import '../blocs/product_cubit.dart';
import 'user_form_screen.dart';
import 'audio_player_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String category; // Accept category dynamically
  final List<Product> products; // Accept filtered product list dynamically

  ProductListScreen({required this.category, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$category Products", // Dynamic title
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                "No products available in this category.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: product,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserFormScreen()),
              );
            },
            icon: Icon(Icons.person_add),
            label: Text("Add User"),
            backgroundColor: Colors.teal,
            tooltip: "Go to User Form",
            heroTag: "userFormBtn",
          ),
          SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
              );
            },
            icon: Icon(Icons.audiotrack),
            label: Text("Audio"),
            backgroundColor: Colors.teal,
            tooltip: "Open Audio Player",
            heroTag: "audioPlayerBtn",
          ),
        ],
      ),
    );
  }
}
