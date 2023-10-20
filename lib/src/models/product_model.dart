class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case ({
          'name': final String name,
          'description': final String description,
          'price': final double price,
          'imageUrl': final String imageUrl,
          'category': final String category,
        }):
        return ProductModel(
          name: name,
          description: description,
          price: price,
          imageUrl: imageUrl,
          category: category,
        );
      case _:
        throw ArgumentError('Invalid JSON');
    }
  }
}
