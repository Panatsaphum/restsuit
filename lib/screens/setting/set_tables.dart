import 'package:flutter/material.dart';
import 'package:restsuitapp/utility/app_style.dart';

class SetTables extends StatefulWidget {
  const SetTables({Key? key}) : super(key: key);

  @override
  _SetTablesState createState() => _SetTablesState();
}

class _SetTablesState extends State<SetTables> {
  String countTable = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        title: Text(
          'Set Tables',
          style: TextStyle(
            fontSize: 30.0,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffebb327),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            const SizedBox(
              height: 120.0,
            ),
            filedTable(),
            AppStyle().mySizebox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  '*Type numbers as whole numbers only.',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            AppStyle().mySizebox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '  Save  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppStyle().fontColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filedTable() => Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(11.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0).add(
          const EdgeInsets.symmetric(vertical: 0.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter the number of tables :  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: TextField(
                      onChanged: (value) => countTable = value.toLowerCase(),
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              AppStyle().mySizebox(),
            ],
          ),
        ),
      );
}
