import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_details_screen.dart';
import '../blocs/product_cubit.dart'; // Import the ProductCubit
import 'user_form_screen.dart'; // Import the UserFormScreen
import 'audio_player_screen.dart'; // Import the AudioPlayerScreen

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal, // Sleek and modern color for the app bar
        elevation: 4,
      ),
      body: BlocBuilder<ProductCubit, List<Product>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner if products are empty
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to the details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(product: product),
                    ),
                  );
                },
                child: ProductCard(product: product), // Use ProductCard widget here
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserFormScreen()), // Navigate to UserFormScreen
              );
            },
            child: Icon(Icons.person_add),
            backgroundColor: Colors.teal, // Sleek button background color
            tooltip: "Add User Form",
            heroTag: "userFormBtn", // Hero tag to avoid duplication
          ),
          SizedBox(height: 16), // Spacing between buttons
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioPlayerScreen()), // Navigate to AudioPlayerScreen
              );
            },
            child: Icon(Icons.audiotrack),
            backgroundColor: Colors.teal, // Sleek button background color
            tooltip: "Audio Player",
            heroTag: "audioPlayerBtn", // Hero tag to avoid duplication
          ),
        ],
      ),
    );
  }
}
