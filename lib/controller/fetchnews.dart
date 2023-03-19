//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=aa4c91ff31e74bff93d2d63a1f41b1a7

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:newsapp/model/newsArticle.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArticle> fetchNews() async {
    final random = Random();
    var sourcesID = sourcesId[random.nextInt(sourcesId
        .length)]; // selecting random source form the list using random() from dart math
    print(sourcesID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourcesID&apiKey=aa4c91ff31e74bff93d2d63a1f41b1a7"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    //print(articles);
    print("###########################################################");
    final newRandom = Random();
    var randomArticles = articles[newRandom.nextInt(articles.length)];
    print(randomArticles);
    print("###########################################################");

    return NewsArticle.fromApiToApp(randomArticles);
  }
}
