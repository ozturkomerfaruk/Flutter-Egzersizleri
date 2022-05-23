import 'dart:convert';

import 'package:bloc_app/core/extensions/app_ext.dart';
import 'package:bloc_app/models/user.dart';
import 'package:http/http.dart' as http;

typedef MyHttpClient = http.Client;

class UserService {
  final MyHttpClient httpClient;

  UserService() : httpClient = MyHttpClient();

  Future<List<User>> fetchUser(UserUrl url) async {
    final response = await httpClient.get(Uri.parse(url.urlToString));

    return (json.decode(response.body) as List)
        .map((user) => User.fromJson(Map<String, dynamic>.from(user)))
        .cast<User>()
        .toList();
  }
}
