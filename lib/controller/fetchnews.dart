//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=aa4c91ff31e74bff93d2d63a1f41b1a7

import 'dart:convert';

import 'package:http/http.dart';

class FetchNews {
  static fetchNews() async {
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=aa4c91ff31e74bff93d2d63a1f41b1a7"));

    Map body_data = jsonDecode(response.body);
    print(body_data);
  }
}
