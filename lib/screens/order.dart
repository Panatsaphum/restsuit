import 'package:flutter/material.dart';
import 'package:restsuitapp/utility/app_style.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({Key? key}) : super(key: key);

  @override
  _OrderMenuState createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        // ignore: deprecated_member_use
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text(
          'Order Menu',
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
        decoration: const BoxDecoration(color: Color(0xffebb327)),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            AppStyle().mySizebox50(),
            AppStyle().mySizebox(),
            AppStyle().mySizebox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  FoodMenuWidget(),
                  FoodMenuWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget showTitltOrder() {
  return Text(
    'Order Menu',
    style: TextStyle(
      fontSize: 48.0,
      color: AppStyle().fontColor,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'Patatya',
    ),
  );
}

class FoodMenuWidget extends StatelessWidget {
  const FoodMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 300.0,
      child: Row(
        children: <Widget>[
          const Image(
            image: AssetImage('images/egg.jpg'),
          ),
          const Expanded(child: Text('test')),
          const Text('Test'),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_sharp,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_circle_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
