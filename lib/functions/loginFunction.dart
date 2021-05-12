import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';

var url = Uri.parse('https://api.librarysrms.com/rest-auth/login/');

Future<int> login(String mobile, String password) async {
  try {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);
    var response = await http.post(
      url,
      headers: {"Content-Type": " application/json"},
      body: json.encode({"username": mobile, "password": password}),
    );
    return response.statusCode;
  } catch (e) {
    print(e.toString());
    return 0;
  }
}
