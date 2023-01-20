// ignore_for_file: file_names, unused_field

import 'package:cflutter4/data.dart';

class Food {
  final int _id;
  final String _title;
  final int _price;
  final String _image;
  final String _description;
  final List<String> _category;
  final List<String>? _imageThumbnail;

  Food(this._id, this._title, this._price, this._image, this._description,
      this._category, this._imageThumbnail);

  get id {
    return _id;
  }

  get title {
    return _title;
  }

  get price {
    return _price;
  }

  get image {
    return _image;
  }

  get description {
    return _description;
  }

  get category {
    return _category;
  }

  get imageThumbnail {
    return _imageThumbnail;
  }

  static getFoodCount() {
    return foods.length;
  }

  static getFood(int idx) {
    Map<String, Object> td = foods[idx];
    return Food(
        int.parse(td["id"].toString()),
        td["title"].toString(),
        int.parse(td["price"].toString()),
        td["image"].toString(),
        td["description"].toString(),
        td["category"] as List<String>,
        td["imageThumbnail"] as List<String>);
  }

  save() {
    throw Exception("Not Implemented yet");
  }

  delete() {
    throw Exception("Not Implemented yet");
  }

  // const Person({this.name, this.age});

  // const Person.anonymous() : this(name: "John Doe", age: null);

  // int get ageInDays => 356 * age;
}
