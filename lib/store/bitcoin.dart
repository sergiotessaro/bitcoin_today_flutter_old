import 'package:bitcoinhoje/data/repositories/get_coins.dart';
import 'package:bitcoinhoje/data/repositories/get_ticker.dart';
import 'package:bitcoinhoje/domain/model/bitcoin_ticker.dart';
import 'package:bitcoinhoje/domain/model/coins.dart';
import 'package:mobx/mobx.dart';
part 'bitcoin.g.dart';

class BitCoinController = _BitCoinControllerBase with _$BitCoinController;

abstract class _BitCoinControllerBase with Store {
  BitcoinTicker bitcointicker = BitcoinTicker();
  Coins coins = Coins();

  @observable
  ObservableList<Coins> coinsList = ObservableList.of([]);

  List<Coins> backupCoins = [];

  @observable
  bool loading;

  @action
  init(String coin) async {
    loading = true;
    await createTicker(coin);
  }

  @action
  createTicker(String coin) async {
    TickerApi api = TickerApi();

    var response = await api.index(coin);
    // print(response.toJson());
   
    bitcointicker = BitcoinTicker.fromJson(response);
    loading = false;
  }

  initIndex() async{
    loading = true;
    await createCoinsList();
  }

  @action
  createCoinsList() async {
    CoinsApi api = CoinsApi();

    var response = await api.index();
    print(response);

    for(var r in response) {
      coins = Coins.fromJson(r);
      coinsList.add(coins);
      loading = false;
    }
  }

   @action
  filter(String text) async{
    if (this.backupCoins.length == 0) {
      this.backupCoins = this.coinsList.toList();
    }
    if (text.isNotEmpty) {
      final coinsList = this.coinsList.toList().where((coin) =>
          coin.country.toLowerCase().contains(text.toLowerCase()));

      this.coinsList = ObservableList.of(coinsList);
    } else {
      this.coinsList = ObservableList.of(this.backupCoins);
    }
  }
}