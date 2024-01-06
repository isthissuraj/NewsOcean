import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/detail_web_view.dart';

// ignore: must_be_immutable
class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsCnt,
      required this.newsDes,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //mainaxisallignment is vertical y axis in column and crossaxisalignment is horizontal x axis and opposit in row
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: FadeInImage.assetNetwork(
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: "asset/Logo.png",
                image: imgUrl)

            //Image.network(
            //   imgUrl,
            //   height: 300,
            //   width: MediaQuery.of(context).size.width,
            //   fit: BoxFit.cover,
            // ),
            ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              newsHead.length > 80
                  ? "${newsHead.substring(0, 80)}..."
                  : newsHead,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsDes,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsCnt.length > 210
                  ? "${newsCnt.substring(0, newsCnt.length - 14)}...."
                  : newsCnt,
              style: const TextStyle(fontSize: 15),
            ),
          ]),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailWebView(newsURL: newsUrl)));
                  },
                  child: const Text(
                    "Read mode",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
