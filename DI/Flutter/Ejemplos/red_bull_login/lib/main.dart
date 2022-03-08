import 'package:flutter/material.dart';
import 'package:red_bull_login/styles.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
  final String _image = "assets/images/red_bull_logo.png";
  final String _backImage = "assets/images/wallpaper_login.png";
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final TextStyle textStyleDefault = const TextStyle(
      color: Colors.white,
      fontSize: RedBullStyle.textSizeTitle,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(children: <Widget>[
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: RedBullStyle.bodyPadding),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_backImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  _image,
                  width: 270,
                ),
                const SizedBox(height: 30),
                Text(
                  'Sign in to get the most of Red Bull',
                  style: textStyleDefault,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create an account to save favorites and download videos to watch anytime you want',
                  style: TextStyle(
                      color: RedBullStyle.fontColor,
                      letterSpacing: .5,
                      height: 1.5,
                      fontSize: RedBullStyle.textSizeSmall),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                Column(children: [
                  SizedBox(
                      width: 400,
                      height: 55,
                      child: SignInButton(
                        Buttons.Facebook,
                        text: "Continue with Facebook",
                        onPressed: () {},
                      )),
                  const SizedBox(height: 15),
                  SizedBox(
                      width: 400,
                      height: 55,
                      child: SignInButton(
                        Buttons.Google,
                        text: "Continue with Google",
                        onPressed: () {},
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Continue with email',
                    style: TextStyle(
                        color: RedBullStyle.grayFontColor,
                        fontSize: RedBullStyle.textSizeSmall),
                  ),
                ]),
              ]),
        ),
        const Positioned(
          top: 80,
          right: RedBullStyle.bodyPadding,
          child: Text(
            'Skip',
            style: TextStyle(
                fontSize: RedBullStyle.textSizeSmall,
                color: RedBullStyle.fontColor),
          ),
        ),
      ]),
    ));
  }
}
