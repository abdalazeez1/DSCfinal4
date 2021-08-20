import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_final4/data/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class card_product extends StatelessWidget {
  final Products product;

  card_product({required this.product});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridTile(
        key: ValueKey(product.id.toString()),
        footer: Container(
          height: size.height * 0.05,
          color: Colors.white70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: Text(
                product.category,
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              )),
              IconButton(
                  onPressed: () async {
                    final currentUser = FirebaseAuth.instance.currentUser;
                    print('upload data to fire store');
                    await FirebaseFirestore.instance
                        .collection('favorite')
                        .doc(product.id.toString())
                        .set({
                      'category': product.category,
                      'image': product.image,
                      'id': product.id,
                      'uid': currentUser!.uid,
                      'description': product.description,
                      'price': product.price,
                      'title': product.title
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ))
            ],
          ),
        ),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 1)),
            child: FadeInImage.assetNetwork(
                placeholder: 'image/load.jpeg', image: product.image)));
  }
}
