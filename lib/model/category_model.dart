class CategoryModel {
  String name, image, id;

  CategoryModel({this.name, this.image, this.id});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    id = map['categoryId'];
  }

  toJson() {
    return {'name': name, 'image': image, 'categoryId': id};
  }
}
