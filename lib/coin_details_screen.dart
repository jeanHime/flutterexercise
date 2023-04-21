import 'package:flutter/material.dart';
import 'package:flutterexercise/model/coin_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinDetailsScreen extends StatelessWidget {
  final CoinModel coinModel;
  const CoinDetailsScreen({Key? key, required this.coinModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButtonIcon(),
        title: Text("Back", style: TextStyle(color: Colors.black)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white ,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 10.0, top: 10.0,bottom: 30.0,right: 10.0,),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(5,5)
                )
              ]
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: NetworkImage(coinModel.logo))
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(coinModel.name,
                              style: GoogleFonts.getFont("Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(coinModel.symbol,
                              style: GoogleFonts.getFont("Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text("USD ${coinModel.price!.toStringAsFixed(2)}",
                              style: GoogleFonts.getFont("Poppins",
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("High:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.high.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("Low:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.low.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("Open:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.open.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("Close:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.close.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("Volume:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.volume.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Text("Market Cap:",
                        style: GoogleFonts.getFont("Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( left: 8.0),
                        child: Text(coinModel.ohlcvModel!.market_cap.toString(),
                          style: GoogleFonts.getFont("Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
