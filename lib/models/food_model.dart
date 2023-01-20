class Food {
  late int id;
  late String title;
  late String description;
  late double price;
  late String image;
  late List category;
  late List<String> imageThumbnail = [];

  Food(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.category,
      required this.imageThumbnail});

  Food.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = double.parse(json['price']);
    image = json['image'];
    category = json['foodcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['foodcategory'] = this.category;
    data['imageThumbnail'] = this.imageThumbnail;
    return data;
  }
}
