import 'package:flutter/material.dart';

@immutable
sealed class Api {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String apiPost = "/posts";
}
