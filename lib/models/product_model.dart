class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image; // Add image property
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image, // Include image in the constructor
    required this.rating,
  });

  // From JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(), // Ensure price is a double
      image: json['image'], // Add the image field here
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  // From JSON data
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
