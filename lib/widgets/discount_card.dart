import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store_app/models/cart_model.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Discount Coupon",
          textAlign: TextAlign.start,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Coupon code"),
                initialValue: CartModel.of(context).couponCode ?? "",
                onFieldSubmitted: (text) {
                  Firestore.instance
                      .collection("coupons")
                      .document(text)
                      .get()
                      .then((docSnap) {
                    if (docSnap.data != null) {
                      CartModel.of(context)
                          .setCoupon(text, docSnap.data["percent"]);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "${docSnap.data["percent"]}% percent discount"),
                        backgroundColor: Theme.of(context).primaryColor,
                      ));
                    } else {
                      CartModel.of(context).setCoupon(null, 0);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Coupon does not exist!"),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  });
                },
              ))
        ],
      ),
    );
  }
}
