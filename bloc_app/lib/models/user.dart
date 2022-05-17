import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
class User {
  int? userId;
  String? firstName;
  String? email;

  User({
    required this.userId,
    required this.firstName,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['first_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['first_name'] = firstName;
    data['email'] = email;
    return data;
  }
}
