import 'package:dsc_final4/data/product.dart';
import 'package:dsc_final4/data/wep_services.dart';
import 'package:flutter/cupertino.dart';

class ProviderProducts extends ChangeNotifier{
List<Products> products=[];
WepServicesProduct wepServicesProduct=WepServicesProduct();

Future<List<Products>> fetchData()async{
products=await  wepServicesProduct.getProducts();
return products;
}



}