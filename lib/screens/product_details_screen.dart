import 'package:flutter/material.dart';
import 'package:app/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal, // Sleek and modern color for the app bar
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Title
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade800,
                ),
              ),
              SizedBox(height: 8),

              // Product Category
              Text(
                "Category: ${product.category}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 16),

              // Product Description
              Text(
                "Description:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.description,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16),

              // Price
              Text(
                "Price: \$${product.price}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16),

              // Product Rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "${product.rating.rate} (${product.rating.count} reviews)",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Add a stylish button at the bottom
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for button (e.g., Add to Cart)
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade600, // Updated parameter
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
