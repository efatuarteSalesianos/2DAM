import 'package:flutter/material.dart';
import 'package:alquiler_coches/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyScanner',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SkyScanner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String coche = "assets/images/coche.png";
  final TextStyle textStyleDefault = const TextStyle(
      color: AlquilerStyle.mainFontColor,
      fontSize: AlquilerStyle.textSizeMedium,
      fontWeight: FontWeight.w400);
  final TextStyle textStyleSmall = const TextStyle(
      color: AlquilerStyle.mainFontColor,
      fontSize: AlquilerStyle.textSizeSmall,
      fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: AlquilerStyle.primary,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: AlquilerStyle.backColor,
            ),
            Positioned(
              top: 10,
              left: 6,
              child: Card(
                child: InkWell(
                  splashColor: Colors.orange.withAlpha(30),
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          'El más barato, Buena puntuación',
                                          style: TextStyle(
                                              color:
                                                  AlquilerStyle.greenFontColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          '45 ofertas',
                                          style: TextStyle(
                                              color:
                                                  AlquilerStyle.greyFontColor,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(coche),
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mini',
                                      style: TextStyle(
                                          fontSize: 23,
                                          color: AlquilerStyle.mainFontColor),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '2 - 3 puertas · Citroen C1 Diesel o similar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AlquilerStyle.greyFontColor),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Icon(
                                                Icons.account_tree_rounded),
                                          ),
                                          Text('Man.')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Icon(Icons.ac_unit_rounded),
                                          ),
                                          Text('A/A')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Icon(Icons.person),
                                          ),
                                          Text('4')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Icon(Icons.assessment),
                                          ),
                                          Text('1')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AlquilerStyle.backColor, width: 1.5)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              child: const Text(
                                '\$35',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text(
                                'SELECCIONAR',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
