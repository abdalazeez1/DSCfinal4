import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_final4/data/product.dart';
import 'package:dsc_final4/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  late List<Products> products;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('favorite').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> Docs =
              snapshot.data!.docs;
          if (Docs.length == 0) {
            return Center(
              child: Text('no Data yet \'add image\''),
            );
          }
          return Container(
            child: GridView.builder(
              itemCount: Docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (_, index) => Expanded(
                child: card_product(
                    product: Products(
                        image: Docs[index]['image'],
                        id: Docs[index]['id'],
                        category: Docs[index]['category'],
                        title: Docs[index]['title'],
                        price: 32,
                        description: Docs[index]['description'])),
              ),
            ),
          );
        });
  }
}
