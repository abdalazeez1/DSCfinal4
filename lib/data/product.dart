import 'dart:convert';

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  late int id;
  late String title;
  late var price;
  late String description;
  late String category;
  late String image;

  static List<Products> productsFromJson(String str) =>
      List<Products>.from(json.decode(str).map((x) {
        print(x);
        return Products.fromJson(x);
      }));

  Products(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image});

  Products.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.price = json["price"];
    this.description = json["description"];
    this.category = json["category"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["price"] = this.price;
    data["description"] = this.description;
    data["category"] = this.category;
    data["image"] = this.image;
    return data;
  }
}
