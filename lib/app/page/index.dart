import 'package:bitcoinhoje/app/page/home.dart';
import 'package:bitcoinhoje/store/bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  BitCoinController bitCoinController = BitCoinController();
  TextEditingController coinController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bitCoinController.initIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bitcoin Now'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Observer(builder: (_) {
          return Container(
            child: bitCoinController.loading == false
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.grey[600],
                                )),
                            child: TextField(
                                style: TextStyle(fontSize: 17),
                                decoration: InputDecoration(
                                    labelText: 'Search',
                                    labelStyle: TextStyle(
                                      color: Colors.orange
                                    ),
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.all(2)),
                                onChanged: (string) async {
                                  await bitCoinController.filter(string);
                                })),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: bitCoinController.coinsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  coinController.text = bitCoinController
                                      .coinsList[index].currency;
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(coin: coinController)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]),
                                    color: index % 2 != 0
                                        ? Colors.grey[300]
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${bitCoinController.coinsList[index].currency} - ${bitCoinController.coinsList[index].country}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }));
  }
}
