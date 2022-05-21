// ignore_for_file: avoid_print

import "dart:convert";

import "package:flutter/services.dart";
import "package:http/http.dart" as http;
import "package:rsa_algorithm/src/configs/keys.dart";
Future<dynamic> doniaSendMessage(String msg) async {
  final http.Response sendResponse =await http
      .get(Uri.parse("$hostUrl/donia/sender/$msg"));

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

Future<dynamic> doniaRecMessage() async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/donia/reciever/$gen&$P_donia&$Q_donia"));
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


Future<dynamic> raghadSendMessage(String msg) async {
  final http.Response sendResponse =await http
      .get(Uri.parse("$hostUrl/raghad/sender/$msg"));

  if (sendResponse.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(sendResponse.body);
    return jsonDecode(sendResponse.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(sendResponse.body);
    print(msg);
    throw Exception("Failed to send data");
  }
}

Future<dynamic> raghadRecMessage() async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/raghad/reciever/$gen&$P_raghad&$Q_raghad"));
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

Future<dynamic> raghadGetKeys() async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/raghad/keys/$gen&$P_raghad&$Q_raghad"));
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

Future<dynamic> doniaGetKeys() async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/donia/keys/$gen&$P_raghad&$Q_raghad"));
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


Future<dynamic> bfAttack(String n, String e, String c) async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/attack/bf/$n&$e&$c"));
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

Future<dynamic> initCCA(int index) async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/attack/cca/init/raghad/$index"));
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

Future<dynamic> startCCA(String c, String e, String n) async {
  final http.Response recResponse = await http
      .get(Uri.parse("$hostUrl/attack/cca/$c&$e&$n"));
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

Future<List<String>> getFileData(String path) async {
  List<String> times = <String>[];
  await rootBundle.loadString(path).then((String q) {
    for (String i in const LineSplitter().convert(q)) {
      times.add(i);
    }
  });
  return times;

}