import 'dart:ffi';

import 'package:flutter/material.dart';

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
          child: Image.network(
            imgUrl,
            height: 350,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              newsHead,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              newsCnt,
              style: const TextStyle(fontSize: 16),
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
                      backgroundColor: Color.fromARGB(0, 221, 9, 90)),
                  onPressed: () {
                    print("clicked $newsUrl");
                  },
                  child: const Text("Read mode")),
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
