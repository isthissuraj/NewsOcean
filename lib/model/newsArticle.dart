// data modelling

import 'package:flutter/rendering.dart';

class NewsArticle {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsArticle(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDes,
      required this.newsCnt,
      required this.newsUrl});

  static NewsArticle FromApiToApp(Map<String, dynamic> article) {
    return NewsArticle(
        imgUrl: article["urlToImage"] ??
            "https://th.bing.com/th/id/R.ab574b22e6cb86f8b6cd67fc302a224b?rik=1LmDn2tvx%2bvcbw&riu=http%3a%2f%2fvoif.org%2fwp-content%2fuploads%2f2014%2f07%2fNews-Briefs.png&ehk=d7YtoAO9%2bKL7kTSnceLVgW3a%2bJh9KUI1EvNyh%2fEESkI%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1",
        newsHead: article["title"] ?? "##",
        newsDes: article["description"] ?? "--",
        newsCnt: article["content"] ?? "###",
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
