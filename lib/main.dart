import 'package:flutter/material.dart';
import 'package:flutterexercise/coin_item.dart';
import 'package:flutterexercise/ranking_controller.dart';
import 'coin_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PogiCoin',
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RankingController rankingController;

  @override
  void initState() {
    super.initState();
    rankingController = RankingController();
    rankingController.getRanking();
  }


  @override
  void dispose() {
    rankingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PogiCoin',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification:  (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
              scrollInfo.metrics.maxScrollExtent) {
            // rankingController.loadMore(rankingController.currentRanking.length);
          }
          return true;
        },
        child: AnimatedBuilder(
          animation: rankingController,
          builder: (BuildContext context, Widget? child) {
            return ListView.builder(
              itemCount: rankingController.currentRanking.length,
              itemBuilder: (context, index) {
                // CoinModel coinModel = rankingController.getCoinInfo(rankingController.ranking[index].id);
                return CoinItem(
                  rankCoinModel: rankingController.currentRanking[index],
                );
              },

            );
          },

        ),
      )
      ,
    );
  }
}
