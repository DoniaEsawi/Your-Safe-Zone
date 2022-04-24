import "dart:convert";

import "package:http/http.dart" as http;
Future<dynamic> sendMessage(String msg) async {
  final http.Response sendResponse =await http
      .get(Uri.parse("http://127.0.0.1:5000/send/$msg"));

  if (sendResponse.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(sendResponse.body);
    return jsonDecode(sendResponse.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception("Failed to send data");
  }
}

Future<dynamic> recMsg(int p, int q) async {
  final http.Response recResponse = await http
      .get(Uri.parse("http://127.0.0.1:5000/recieve/$p&$q"));
  if (recResponse.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(recResponse.body);
    return jsonDecode(recResponse.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception("Failed to recieve data");
  }
}