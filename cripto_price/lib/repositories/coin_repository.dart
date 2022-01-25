import 'package:cripto_price/models/coin.dart';

class CoinRepository {
  static List<Coin> table = [
    Coin(icon: 'images/ada.png', name: 'cardano', initials: 'ada', price: 5.74),
    Coin(
        icon: 'images/bnb.png',
        name: 'binance coin',
        initials: 'bnb',
        price: 2067.07),
    Coin(
        icon: 'images/btc.png',
        name: 'bitcoin',
        initials: 'btc',
        price: 203504.54),
    Coin(
        icon: 'images/eth.png',
        name: 'ethereum',
        initials: 'eth',
        price: 13452.23),
    Coin(
        icon: 'images/luna.png',
        name: 'terra',
        initials: 'luna',
        price: 359.38),
    Coin(
        icon: 'images/sol.png', name: 'solana', initials: 'sol', price: 531.58),
    Coin(
        icon: 'images/usdt.png', name: 'tether', initials: 'usdt', price: 5.47),
    Coin(icon: 'images/xrp.png', name: 'xrp', initials: 'xrp', price: 3.34),
  ];
}
