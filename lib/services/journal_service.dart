import 'dart:convert';

import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

// class JournalService {
//   static const String url = "http://192.168.200.135:3000/";
//   static const String resource = "learnhttp/";

//   String getURL() {
//     return "$url$resource";
//   }

//   // void register(String content) {
//   //   print(content);
//   //   // http.post(Uri.parse(getURL()), body: {'content': ''});
//   //   http.post(Uri.parse(getURL()), body: '{"content": "$content"}');
//   // }

//   Future<String> get() async {
//     http.Response response = await http.get(Uri.parse(getURL()));
//     print(response.body);
//     return response.body;
//   }
// }

class JournalService {
  static const String url = 'http://192.168.200.135:3000/';
  static const String resource = 'learnhttp/';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return '$url$resource';
  }

  register(String content) {
    print(content);
    client.post(Uri.parse(getUrl()),
        body: json.encode(
          {"content": content},
        ),
        headers: {'Content-Type': 'application/json'});
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
