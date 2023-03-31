import 'package:flutter/material.dart';
import 'package:newsapp/controller/fetchnews.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    //to update the UI without using setState()
    return ValueListenableBuilder(
      //whenever something will be changed inside the box it will listen to it
      valueListenable: Hive.box("ThemeBox").listenable(),
      //if something has been changed in valuelistenable then it will re-build or it will call the builder again
      builder: (context, box, child) {
        //saving the value inside the hive box,
        final isDark = box.get('isDark', defaultValue: false);
        return Scaffold(
        appBar: AppBar(
           actions: [
             //it is a toggle switch
             Switch(
                value: isDark,
                onChanged: (val) {
                  box.put('isDark', val);
                },
              ),
              ],
        title: const Text("News Ocean"),
        backgroundColor: Colors.deepPurpleAccent.shade200,
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
                    child: CircularProgressIndicator(
                     color: Colors.deepPurpleAccent,
                    ),
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
   });
  }
}
