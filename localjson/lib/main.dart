import 'package:flutter/material.dart';
import 'package:fromjson/currency.dart';
import 'package:fromjson/list_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromARGB(255, 124, 98, 98)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Currency> currencyList = [];
  List<String> siralamaList = ["Last Price", "Volume"];
  int siralamaIndex = 0;
  bool butonTrue = false;

  siralamaFunction() {
    setState(() {
      currencyList.sort((a, b) => siralamaIndex == 0
          ? b.lastPrice.compareTo(a.lastPrice)
          : b.volume.compareTo(a.volume));
    });
  }

  @override
  void initState() {
    currencyList = currencyData.map((e) => Currency.fromJson(e)).toList();
    siralamaFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Türe Göre:\t",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: DropdownButton(
                              dropdownColor: const Color.fromARGB(255, 124, 98, 98),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              iconSize: 20,
                              isExpanded: true,
                              value: siralamaList[siralamaIndex],
                              onChanged: (val) {
                                setState(() {
                                  siralamaIndex =
                                      siralamaList.indexOf(val!.toString());
                                  siralamaFunction();
                                });
                              },
                              items: siralamaList
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currencyList = currencyList.reversed.toList();
                            butonTrue = !butonTrue;
                          });
                        },
                        child: butonTrue
                            ? const Text("En düşük")
                            : const Text("En yüksek"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: currencyList
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              child: Stack(
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  const SizedBox(
                                    width: 250,
                                    height: 100,
                                  ),
                                  Positioned(
                                    top: -40,
                                    left: -20,
                                    child: Container(
                                      child: currencyMethod(
                                          e.base.toString(), 15, Colors.white),
                                      width: 100,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -50,
                                    left: 100,
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          currencyMethod(e.quote.toString(), 16,
                                              Colors.black),
                                        ],
                                      ),
                                      width: 100,
                                      height: 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: 100,
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          currencyMethod(e.type.toString(), 16,
                                              Colors.black),
                                        ],
                                      ),
                                      width: 120,
                                      height: 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: -50,
                                    left: 200,
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          currencyMethod(e.lastPrice.toString(),
                                              16, Colors.black),
                                        ],
                                      ),
                                      width: 500,
                                      height: 150,
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: 200,
                                    child: SizedBox(
                                      child: Row(
                                        children: [
                                          currencyMethod(e.volume.toString(),
                                              16, Colors.black),
                                        ],
                                      ),
                                      width: 500,
                                      height: 150,
                                    ),
                                  ),
                                  // currencyMethod(e.base.toString(), "Base:"),
                                  // const SizedBox(height: 10),
                                  // currencyMethod(e.quote.toString(), "Quote:"),
                                  // const SizedBox(height: 10),
                                  // currencyMethod(e.type.toString(), "Type:"),
                                  // const SizedBox(height: 10),
                                  // currencyMethod(
                                  //     e.lastPrice.toString(), "Last Price:"),
                                  // const SizedBox(height: 10),
                                  // currencyMethod(e.volume.toString(), "Volume"),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding currencyMethod(String currency, double fontSize, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            currency,
            style: TextStyle(
                fontSize: fontSize, color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
