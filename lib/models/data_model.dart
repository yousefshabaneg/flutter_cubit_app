class DataModel {
  late String name;
  late String description;
  late String img;
  late String location;
  late int price;
  late int stars;
  late int people;
  DataModel({
    required this.name,
    required this.description,
    required this.img,
    required this.location,
    required this.price,
    required this.stars,
    required this.people,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      description: json['description'],
      img: json['img'],
      location: json['location'],
      price: json['price'],
      stars: json['stars'],
      people: json['selected_people'],
    );
  }
}
