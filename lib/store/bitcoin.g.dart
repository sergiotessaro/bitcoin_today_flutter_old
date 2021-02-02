// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BitCoinController on _BitCoinControllerBase, Store {
  final _$coinsListAtom = Atom(name: '_BitCoinControllerBase.coinsList');

  @override
  ObservableList<Coins> get coinsList {
    _$coinsListAtom.reportRead();
    return super.coinsList;
  }

  @override
  set coinsList(ObservableList<Coins> value) {
    _$coinsListAtom.reportWrite(value, super.coinsList, () {
      super.coinsList = value;
    });
  }

  final _$loadingAtom = Atom(name: '_BitCoinControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_BitCoinControllerBase.init');

  @override
  Future init(String coin) {
    return _$initAsyncAction.run(() => super.init(coin));
  }

  final _$createTickerAsyncAction =
      AsyncAction('_BitCoinControllerBase.createTicker');

  @override
  Future createTicker(String coin) {
    return _$createTickerAsyncAction.run(() => super.createTicker(coin));
  }

  final _$createCoinsListAsyncAction =
      AsyncAction('_BitCoinControllerBase.createCoinsList');

  @override
  Future createCoinsList() {
    return _$createCoinsListAsyncAction.run(() => super.createCoinsList());
  }

  final _$filterAsyncAction = AsyncAction('_BitCoinControllerBase.filter');

  @override
  Future filter(String text) {
    return _$filterAsyncAction.run(() => super.filter(text));
  }

  @override
  String toString() {
    return '''
coinsList: ${coinsList},
loading: ${loading}
    ''';
  }
}
