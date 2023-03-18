import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:newsapp/controller/fetchnews.dart';
import 'package:newsapp/model/newsArticle.dart';
import 'package:newsapp/view/widgets/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArticle newsArticle;
  bool _userScrolling = false;

  getNews() async {
    newsArticle = await FetchNews.fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            _userScrolling = true;
          }
          return false;
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            getNews();

            return NewsContainer(
              newsDes: newsArticle.newsDes,
              imgUrl: newsArticle.imgUrl,
              newsHead: newsArticle.newsHead,
              newsCnt: newsArticle.newsCnt,
              newsUrl: newsArticle.newsUrl,
            );
          },
          onPageChanged: (index) {
            if (!_userScrolling) {
              // Handle automatic scrolling here
            }
            _userScrolling = false;
          },
        ),
      ),

      // body: PageView.builder(
      //     controller: PageController(initialPage: 0),
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index) {
      //       getNews();

      //       return NewsContainer(
      //         newsDes: newsArticle.newsDes,
      //         imgUrl: newsArticle.imgUrl,
      //         newsHead: newsArticle.newsHead,
      //         newsCnt: newsArticle.newsCnt,
      //         newsUrl: newsArticle.newsUrl,
      //       );
      //     }),
    );
  }
}
