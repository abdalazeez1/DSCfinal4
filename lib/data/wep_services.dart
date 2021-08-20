import 'package:dsc_final4/data/product.dart';
import 'package:http/http.dart' as http;

class WepServicesProduct {
  Future  getProducts() async {
  final   response = await http.get(
      Uri.parse(
        'https://fakestoreapi.com/products/',
      ),
    );
    if (response.statusCode == 200) {
      return Products.productsFromJson(response.body);
    } else {
      print('cant get data from wep services');
      throw Exception('Failed to get properties.');
    }
  }
}
