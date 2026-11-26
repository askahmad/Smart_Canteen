class FoodItemModel {
  final String id;
  final String name;
  final String price;
  final double numericPrice;
  final String image;
  final String category;
  final String description;

  FoodItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.numericPrice = 500.0,
    required this.image,
    required this.category,
    this.description = '',
  });

  factory FoodItemModel.fromMap(Map<String, dynamic> map, String id) {
    return FoodItemModel(
      id: id,
      name: map['name'] ?? '',
      price: map['price'] ?? 'Rs 500',
      numericPrice: (map['numericPrice'] as num?)?.toDouble() ?? 500.0,
      image: map['image'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'numericPrice': numericPrice,
      'image': image,
      'category': category,
      'description': description,
    };
  }
}
