import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future runPutTransporterApi(
    {required Map toBeUpdated, required String transporterId}) async {
  final String transporterApiUrl =
      '${dotenv.env['transporterApiUrl'].toString()}';
  final String additionalQuery = '/';
  String body = json.encode(toBeUpdated);
  final http.Response response = await http.put(
      Uri.parse("$transporterApiUrl$additionalQuery$transporterId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: body);
  if (response.statusCode == 200) {
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (decodedResponse["status"].toString() == "Success") {
      return "Success";
    } else {
      return "Error";
    }
  } else {
    return "Error";
  }
}
