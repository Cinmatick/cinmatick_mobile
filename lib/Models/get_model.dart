class Get {
  final String name;
  final String image;

  const Get({
    required this.name,
    required this.image,
  });

  factory Get.fromJson(Map<String, dynamic> jsonData) {
    return Get(
      name: jsonData['name'],
      image: jsonData['image'],
    );
  }
}
