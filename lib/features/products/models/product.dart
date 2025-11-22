class Product {
  final String id;
  final String name;
  final String description;
  final String version;
  final String platform;
  final String developer;
  final String link;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.version,
    required this.platform,
    required this.developer,
    required this.link,
    required this.createdAt,
    this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    String? version,
    String? platform,
    String? developer,
    String? link,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      version: version ?? this.version,
      platform: platform ?? this.platform,
      developer: developer ?? this.developer,
      link: link ?? this.link,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

