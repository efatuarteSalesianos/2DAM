import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 45,
            left: 163,
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/main'),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
