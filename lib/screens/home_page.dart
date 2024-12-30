import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_cubit.dart';
import '../models/product_model.dart';
import 'product_list_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: BlocBuilder<ProductCubit, List<Product>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          // Extract unique categories from the product list
          final categories = products
              .map((product) => product.category)
              .toSet()
              .toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 boxes per row for smaller size
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9, // Slightly taller boxes
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final filteredProducts = products
                    .where((product) => product.category == category)
                    .toList();

                return StatefulBuilder(
                  builder: (context, setState) {
                    bool isHovered = false;

                    return MouseRegion(
                      cursor: SystemMouseCursors.click, // Change cursor to hand pointer
                      onEnter: (_) {
                        setState(() => isHovered = true);
                      },
                      onExit: (_) {
                        setState(() => isHovered = false);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListScreen(
                                category: category,
                                products: filteredProducts,
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: isHovered
                                ? Colors.teal.shade200
                                : Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: isHovered
                                    ? Colors.teal.withOpacity(0.5)
                                    : Colors.teal.withOpacity(0.3),
                                blurRadius: isHovered ? 12 : 6,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.category,
                                  size: 48.0,
                                  color: isHovered
                                      ? Colors.teal.shade900
                                      : Colors.teal.shade700,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  category.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: isHovered
                                        ? Colors.teal.shade900
                                        : Colors.teal.shade800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
