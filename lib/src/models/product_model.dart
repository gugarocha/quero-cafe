class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    switch (json) {
      case ({
          'name': final String name,
          'description': final String description,
          'price': final double price,
          'imageUrl': final String imageUrl,
          'category': final String category,
        }):
        return ProductModel(
          id: id,
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
