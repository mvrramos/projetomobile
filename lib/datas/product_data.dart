import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;
  late String id;
  late String title;
  late String description;
  late int price;
  late List images;
  late List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot.get('title');

    description = snapshot.get('description');
    price = snapshot.get('price');
    images = snapshot.get('images');
    sizes = snapshot.get('sizes');
  }

  Map<String, dynamic> toResumeMap() {
    return {
      "title": title,
      "description": description,
      "price": price,
    };
  }
}
