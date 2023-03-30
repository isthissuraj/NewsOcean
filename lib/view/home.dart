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
  
  //which provides change notification to its listeners.
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

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
    // ValueListenable listens to it and updates the UI
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: Scaffold(
        appBar: AppBar(
           actions: [
                IconButton(
                    onPressed: () => _notifier.value = mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    icon: const Icon(Icons.lightbulb))
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
