import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muvver/utils/globals.dart';

class TravelerRepository {
  dynamic _dadosCreateTravel = [];

  Future createTravel(transportation, departureDate, arrivalDate, similarSize, weight, price, destinations) async {
    var response = await http.post(
        url_create_travel,
        headers: {
          'Content-Type' : 'application/json',
          'USER_EMAIL': url_email,
          'USER_TOKEN': url_token
        },
        body: '{'
        '"transportation" : "$transportation", '
        '"departure_date" : "$departureDate", '
        '"arrival_date" : "$arrivalDate", '
        '"similar_size" : "$similarSize", '
        '"weight" : $weight, '
        '"price" : $price, '
        '"destinations" : $destinations}'
    );

    _dadosCreateTravel = json.decode(response.body);

    return _dadosCreateTravel;
  }
}