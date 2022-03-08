import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful, Private Sharing',
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
      home: const MyHomePage(title: 'Beautiful, Private Sharing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _image = "assets/images/path_logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE62F17),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              _image,
              width: 230,
            ),
            const Text("Beautiful, Private Sharing",
                style: TextStyle(color: Color(0xFFF98B73), fontSize: 17)),
            const SizedBox(height: 100),
            ElevatedButton(
              child: const Text('Sign Up',
                  style: TextStyle(color: Color(0xFFE62F16), fontSize: 20)),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(97, 17, 97, 17)),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {},
            ),
            const SizedBox(height: 25),
            const Text("Already have a Path account?",
                style: TextStyle(color: Color(0xFFF98B73), fontSize: 15)),
            const SizedBox(height: 10),
            OutlinedButton(
                child: const Text('Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: const Color(0x6FF98B73),
                    side: const BorderSide(color: Colors.white, width: 1),
                    padding: const EdgeInsets.fromLTRB(105, 17, 105, 17))),
            const SizedBox(height: 20),
            SizedBox(
              width: 260,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "By using Path, you agree to Path's ",
                    style: TextStyle(color: Color(0xFFF98B73), fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms of Use',
                          /* recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // navigate to desired screen
                    } */
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          )),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              color: Color(0xFFF98B73), fontSize: 15)),
                      TextSpan(
                          text: 'Private Policy',
                          /* recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // navigate to desired screen
                    } */
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          )),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
