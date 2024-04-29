class Category {
  final int id;
  final String name;
  final String img;
  final String description;
  final int serviceTypeId;
  final String serviceTypeName;

  Category({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.serviceTypeId,
    required this.serviceTypeName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      description: json['description'] ?? '',
      serviceTypeId: json['service_type_id'] ?? 0,
      serviceTypeName: json['service_type_name'] ?? '',
    );
  }
}
