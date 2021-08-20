import 'package:dsc_final4/data/product.dart';
import 'package:dsc_final4/data/provdier_product.dart';
import 'package:dsc_final4/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  late List<Products> products;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Provider.of<ProviderProducts>(context, listen: false).fetchData(),
        builder: (context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            products = snapshot.data!;
            print('snap');
            print(snapshot.data);
            return Container(
              child: GridView.builder(
                itemCount: products.length,
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
                  child: card_product(product: products[index]),
                ),
              ),
            );
          } else {
            return Text('no data');
          }
        });
  }
}
