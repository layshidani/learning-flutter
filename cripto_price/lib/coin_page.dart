import 'package:cripto_price/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:cripto_price/repositories/coin_repository.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  final table = CoinRepository.table;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Coin> selected = [];

  dinamycAppBar() {
    if (selected.isEmpty) {
      return AppBar(
        title: Text('Criptomoedas'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            setState(() => {selected = []})
          },
        ),
        title: Text('${selected.length} selecionadas'),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dinamycAppBar(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int coin) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: (selected.contains(table[coin]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(table[coin].icon),
                    width: 40,
                  ),
            title: Text(
              table[coin].name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              real.format(table[coin].price),
              style: const TextStyle(fontSize: 15),
            ),
            selected: selected.contains(table[coin]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selected.contains(table[coin]))
                    ? selected.remove(table[coin])
                    : selected.add(table[coin]);
              });
            },
            onTap: () {
              setState(() {
                if (selected.isNotEmpty) {
                  (selected.contains(table[coin]))
                      ? selected.remove(table[coin])
                      : selected.add(table[coin]);
                }
              });
            },
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, ___) => const Divider(),
        itemCount: table.length,
      ),
    );
  }
}
