import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> runDeleteShipperApi(String shipperId) async {
  final String shipperApiUrl = '${dotenv.env['shipperApiUrl'].toString()}';
  final String additionalQuery = '/';

  var jsonData;
  http.Response response =
      await http.delete(Uri.parse("$shipperApiUrl$additionalQuery$shipperId"));
  jsonData = json.decode(response.body);
  print(jsonData.status.toString());
}
