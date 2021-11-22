import 'package:flutter/material.dart';
import 'package:restsuitapp/utility/app_style.dart';

class EditMenu extends StatefulWidget {
  const EditMenu({Key? key}) : super(key: key);

  @override
  _EditMenuState createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        // ignore: deprecated_member_use
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text(
          'Edit Menu',
          style: TextStyle(
            fontSize: 45.0,
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
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffebb327)
           
            ),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: const <Widget>[],
        ),
      ),
    );
  }
}
