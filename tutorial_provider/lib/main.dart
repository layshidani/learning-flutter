import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // lista de providers disponibilizado em todo MyApp
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.watch -> escuta mudanças
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Provider",
        ),
        actions: [Text("Count: ${viewModel.count}")],
      ),
      body: Center(
        child: viewModel.isLoading
            ? CircularProgressIndicator()
            : Text(viewModel.count),
      ),
      floatingActionButton: MyButton(),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.watch -> escuta mudanças
    final viewModel = context.watch<HomeViewModel>();

    return FloatingActionButton(
      onPressed: () {
        viewModel.incrementCount();
      },
      child: Icon(Icons.add),
    );
  }
}

class HomeViewModel extends ChangeNotifier {
  int _count = 0;
  String get count {
    return "${_count}";
  }

  bool isLoading = false;

  void setLoading(bool loading) {
    isLoading = loading;

    // informa os listeners que houve mudança
    notifyListeners();
  }

  void incrementCount() async {
    setLoading(true);
    await Future.delayed(
      Duration(seconds: 2),
    );

    _count++;
    setLoading(false);
  }
}
