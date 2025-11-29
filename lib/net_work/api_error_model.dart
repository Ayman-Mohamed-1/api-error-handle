import 'package:flutter/cupertino.dart';

class ApiErrorModel {
  final String massege;
  final int statusCode;
  final IconData icon;

  ApiErrorModel({
    required this.massege,
    required this.statusCode,
    required this.icon,
  });
}
