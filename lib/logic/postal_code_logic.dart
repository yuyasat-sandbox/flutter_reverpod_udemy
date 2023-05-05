import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/postal_code.dart';

class PostalCodeLogic {
  Future<PostalCode> getPostalCode(String postalCode) async {
    if (postalCode.length != 7) {
      throw Exception('Postal Code must be 7 characters.');
    }

    final upper = postalCode.substring(0, 3);
    final lower = postalCode.substring(3, 7);

    // https://madefor.github.io/postal-code-api/api/v1/100/0014.json
    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/$upper/$lower.json';
    final apiUri = Uri.parse(apiUrl);
    http.Response response = await http.get(apiUri);

    if (response.statusCode != 200) {
      throw Exception('No postal code: $postalCode');
    }
    var jsonData = json.decode(response.body);
    return PostalCode.fromJson(jsonData);
  }

  bool willProceed(String postalCode) {
    return postalCode.length == 7;
  }
}
