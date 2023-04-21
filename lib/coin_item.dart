import 'package:flutter/material.dart';
import 'package:flutterexercise/coin_details_screen.dart';
import 'package:flutterexercise/model/coin_model.dart';
import 'package:flutterexercise/model/rank_model.dart';
import 'package:flutterexercise/ranking_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinItem extends StatelessWidget {
  // final CoinModel coinModel;
  final RankCoinModel rankCoinModel;
  const CoinItem({
    Key? key,
    // required this.coinModel,
    required this.rankCoinModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CoinModel>(
        future: RankingController().getCoinInfo(rankCoinModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CoinModel coinModel = snapshot.data!;
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailsScreen(coinModel: coinModel,)));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 20.0,
                  bottom: 20.0,
                  right: 10.0,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(5, 5))
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(image: NetworkImage(coinModel.logo))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coinModel.name,
                            style: GoogleFonts.getFont(
                              "Poppins",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            coinModel.symbol,
                            style: GoogleFonts.getFont(
                              "Poppins",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "USD ${coinModel.price!.toStringAsFixed(2)}",
                            style: GoogleFonts.getFont(
                              "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Text(
                          //   "${value.isNegative ? "": "+"} ${value.toStringAsFixed(2)}",
                          //   style: GoogleFonts.getFont(
                          //     "Poppins",
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
