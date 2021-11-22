import 'package:flutter/material.dart';

class AppStyle {
  Color darkColor = Colors.pinkAccent.shade400;
  Color primaryColor = Colors.yellow.shade700;
  Color mainColor = Colors.grey.shade300;
  Color fontColor = const Color(0xff006e71);
  Color redColor = Colors.red.shade400;
  Color yello1Color = const Color(0xfffdcb2c);

  SizedBox mySizebox() => const SizedBox(
        width: 8.0,
        height: 16.0,
      );

  SizedBox mySizebox25() => const SizedBox(
        width: 20.0,
        height: 20.0,
      );

  SizedBox mySizebox50() => const SizedBox(
        width: 60.0,
        height: 60.0,
      );

  Text showTitle(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 24.0,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold),
      );

  Text showTitleH2(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold),
      );

  Widget showLogo() {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return SizedBox(
      child: Text(
        'Rest Suit',
        style: TextStyle(
          fontSize: 50.0,
          color: AppStyle().fontColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Patatya',
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(4.0, 0.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }

  Text formTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: .0,
          color: Colors.green.shade300,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Patatya',
        ),
      );

  Text formTitle2(String title) => Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 60.0,
          color: AppStyle().fontColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontFamily: 'Patatya',
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(4.0, 0.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      );

  AppStyle();
}
