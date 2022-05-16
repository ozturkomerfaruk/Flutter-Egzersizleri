/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<StateData>(
        create: (BuildContext context) => StateData(),
        builder: (context, child) {
          return const MyApp();
        },
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  const SolWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sehir = Provider.of<StateData>(context).sehir;
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            const Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Sehir: $sehir',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  const SagWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: const [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  const SagWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: const [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  const SagWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        const Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          'Şehir: ... ',
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          onChanged: (input) {
            //newCityFunction(input);
            Provider.of<StateData>(context, listen: false).newCity(input);
          },
        ),
      ]),
    );
  }
}

class StateData extends ChangeNotifier {
  String sehir = "Ankara";
  void newCity(String veri) {
    sehir = veri;
    notifyListeners();
  }
}
 */