import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchnews.dart';
import 'package:newsapp/model/newsArticle.dart';
import 'package:newsapp/view/widgets/news_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  late NewsArticle newsArticle;

  getNews() async {
    newsArticle = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Ocean"),
        backgroundColor: Colors.deepPurple,
      ),
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            getNews();
          },
          itemBuilder: (context, index) {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    newsDes: newsArticle.newsDes,
                    imgUrl: newsArticle.imgUrl,
                    newsHead: newsArticle.newsHead,
                    newsCnt: newsArticle.newsCnt,
                    newsUrl: newsArticle.newsUrl,
                  );
          }),
    );
  }
}
