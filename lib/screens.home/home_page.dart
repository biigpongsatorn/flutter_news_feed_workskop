import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/news.dart';
import './widgets/news_card.dart';
import './news_detail.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    spamNews();
    super.initState();
  }

  int pageIndex = 0;
  List<News> news = List<News>();

  void spamNews() {
    news.add(News(
        cover: 'https://ichef.bbci.co.uk/news/624/cpsprodpb/1474E/production/_109709738_gettyimages-1177703948-1.jpg',
        title: "The curtain came up on day two of the House of Representatives' public impeachment hearings and, once again, the proceedings started off with a bang.",
        content: "On Wednesday, it was disclosure of an overheard phone call between Donald Trump and US Ambassador to the EU Gordon Sondland during which the president may have asked about Ukrainian investigations. Friday's big developments included the White House release of a contradictory readout of the Mr Trump's first phone call with Ukrainian President Volodymyr Zelensky and a presidential tweet that had Republicans in Congress scrambling.",
        createdAt: DateTime.parse('20190611')
      )
    );
    news.add(News(
        cover: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/9101/production/_109712173_058014888-1.jpg',
        title: 'Iran petrol price hike: Protests erupt over surprise rationing',
        content: "Protests have erupted across Iran after the government unexpectedly announced it was rationing petrol and increasing its price, state media report. Prices went up by at least 50% on Friday. The authorities have reduced heavy subsidies on petrol prices to curb the impact of US sanctions which have badly affected Iran's economy. Iran faces stiff sanctions on oil exports after the US pulled out of a nuclear deal with world powers in 2018.",
        createdAt: DateTime.parse('20190520')
      )
    );
    news.add(News(
        cover: 'https://ichef.bbci.co.uk/news/660/cpsprodpb/11B51/production/_109692527_hongkonggas.jpg',
        title: "Hong Kong: 'I was tear gassed getting my lunch'",
        content: "He is describing the moment this week when Hong Kong's protests came to the central financial district , one of the world's biggest commercial hubs.He says it was a watershed moment, that's made him and many of his peers question their future in the city.Speaking to the BBC under condition of anonymity, directors at some of the biggest international banks and law firms said they are seeing their business in Hong Kong shrink as the protests continue to escalate.Financial services make up a fifth of Hong Kong's economy and people come from all over the world to live and work here. Its large expatriate community is attracted by the low taxes, well-paid jobs, stability and high standards of living.",
        createdAt: DateTime.parse('20190401')
      )
    );
  }

  void openDetailPage(News news) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewsDetailPage(news: news)));
  }

  @override
  Widget build(BuildContext context) {
    var body = SafeArea(child: Center(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              openDetailPage(news[index]);
            },
            child: NewsCard(news[index]),
          );
        }
      )
    ));
    return Platform.isIOS
      ? CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(widget.title)),
        child: body
      )
      : Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
    );
  }
}
