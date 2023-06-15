import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetomobile/datas/product_data.dart';

class CartProduct {
  late String cid;
  late String category;
  late String pid;
  late int quantity;
  late String sizes;

  late ProductData productData;

  CartProduct() {
    cid = '';
    category = '';
    pid = '';
    quantity = 0;
    sizes = '';
  }

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.id;
    category = document.get('category');
    pid = document.get('pid');
    quantity = document.get('quantity');
    sizes = document.get('sizes');
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "cid": cid,
      "quantity": quantity,
      "sizes": sizes,
      "product": productData.toResumeMap()
    };
  }
}
