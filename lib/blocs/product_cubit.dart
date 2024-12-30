import 'package:bloc/bloc.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For making HTTP requests
import '../models/product_model.dart';

class ProductCubit extends Cubit<List<Product>> {
  ProductCubit() : super([]);

  Future<void> fetchProducts() async {
    try {
      // Replace with your actual API URL
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final products = jsonData.map((item) => Product.fromJson(item)).toList();
        emit(products);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      emit([]);
    }
  }
}
