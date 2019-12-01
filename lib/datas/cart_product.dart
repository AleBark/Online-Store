import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_store_app/datas/product_data.dart';

class CartProduct {
  String cid;
  String category;
  String pid;
  String size;
  int quantity;

  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot documentSnapshot) {
    cid = documentSnapshot.documentID;
    category = documentSnapshot.data["category"];
    quantity = documentSnapshot.data["quantity"];
    size = documentSnapshot.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
//      "product": productData.toResumedMap()
    };
  }
}
