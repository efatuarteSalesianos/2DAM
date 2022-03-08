import 'package:flutter/material.dart';
import 'package:kayak_card/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kayak.es',
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
      home: const MyHomePage(title: 'Kayak'),
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
  final String logoIberia = "assets/images/iberia_logo.png";
  final TextStyle textStyleDefault = const TextStyle(
      color: KayakStyle.fontMainColor,
      fontSize: KayakStyle.textSizeMedium,
      fontWeight: FontWeight.w400);
  final TextStyle textStyleSmall = const TextStyle(
      color: KayakStyle.grayFontColor,
      fontSize: KayakStyle.textSizeSmall,
      fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: KayakStyle.primary,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: const Color(0xFFE4E5EA),
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
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '20:55',
                                        style: textStyleDefault,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('SALIDA', style: textStyleSmall)
                                    ],
                                  ),
                                  Row()
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 50, 50, 0),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: const Text(
                                          'MAD',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'Madrid',
                                        style: textStyleDefault,
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: Image.asset(
                                            logoIberia,
                                            width: 25,
                                          ),
                                        ),
                                        const Text(
                                          'Iberia 7448',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: KayakStyle.grayFontColor,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Duración: 2h 10m',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: KayakStyle.grayFontColor,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '22:05',
                                        style: textStyleDefault,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('LLEGADA', style: textStyleSmall)
                                    ],
                                  ),
                                  Row()
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 50, 50, 0),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: const Text(
                                          'LHR',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'Londres',
                                        style: textStyleDefault,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
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
