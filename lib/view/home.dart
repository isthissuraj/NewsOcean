import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/news_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return NewsContainer(
                imgUrl:
                    "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA18Ju0h.img?w=1920&h=1080&q=60&m=2&f=jpg",
                newsHead:
                    "Microsoft Announces AI-Powered 'Copilot' for Word, Excel, Outlook, Teams And More; What It Means For Users",
                newsDes:
                    "The tech giant based in Redmond, Washington, will also add a chat function called Business Chat, which resembles the popular ChatGPT. It takes commands and carries out actions like summarizing an email about a particular project to co-workers using user data ",
                newsUrl:
                    "https://www.msn.com/en-in/money/news/microsoft-announces-ai-powered-copilot-for-word-excel-outlook-teams-and-more-what-it-means-for-users/ar-AA18Jd5o?cvid=051c90afc6fb4d038dc0ae08281529ed&ei=7#image=1");
          }),
    );
  }
}
