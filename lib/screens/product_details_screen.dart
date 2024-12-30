import 'package:flutter/material.dart';
import 'package:app/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final int index;

  ProductDetailsScreen({required this.product, required this.index});

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
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12), // Rounded corners for the image
                child: Image.network(
                  product.image,
                  width: (index == 4 ) 
                      ? 370 
                      : 500, // Conditionally set width
                  height: (index == 4 || index == 5 || index == 7) 
                      ? 640 
                      : 650, // Conditionally set height
                  fit: BoxFit.cover, // Ensures the image fills the space proportionally
                ),
              ),
              SizedBox(height: 20),

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

              // Stylish Button at the bottom
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
