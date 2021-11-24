import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restsuitapp/screens/cashier.dart';
import 'package:restsuitapp/screens/home.dart';
import 'package:restsuitapp/screens/kitchen.dart';
import 'package:restsuitapp/screens/order.dart';
import 'package:restsuitapp/screens/setting.dart';
import 'package:restsuitapp/screens/setting/add_menu.dart';
import 'package:restsuitapp/utility/app_style.dart';
import 'package:restsuitapp/utility/navigation_drawer.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

int currentIndex = 0;
final screens = [
  const Welcome(),
  const AddMenu(),
];

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavigationDrawerPage(),
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('images/logo.png'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Container(
            width: 30,
            margin: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                logoutDialog(context, 'Do you want to Sign out?');
              },
              icon: const Icon(
                Icons.power_settings_new,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffebb327),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: AppStyle().showAppName()),
                ],
              ),
              //profile(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppStyle().mySizebox(),
                  orderButton(),
                  AppStyle().mySizebox(),
                  kitchenButton(),
                  AppStyle().mySizebox(),
                  cashierButton(),
                  AppStyle().mySizebox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderButton() {
    return SizedBox(
      width: 300.0,
      height: 130.0,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.fastfood,
          size: 50.0,
        ),
        label: const Text(
          "  Order    ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const OrderMenu());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget kitchenButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 300.0, height: 130.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.room_service,
          size: 50.0,
        ),
        label: const Text(
          "  Kitchen ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const Kitchen());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget cashierButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 300.0, height: 130.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.monetization_on,
          size: 50.0,
        ),
        label: const Text(
          "  Cashier ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const Cashier());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget settingButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 184.0, height: 80.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.settings,
          size: 40.0,
        ),
        label: const Text(
          "Setting ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const SetTing());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Container(
      color: Colors.grey.shade400,
      constraints: const BoxConstraints(minHeight: 15.0, maxWidth: 15.0),
    );
  }
}

Future signOut() async {
  try {
    return await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<void> logoutDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Center(
          child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      )),
      children: <Widget>[
        // ignore: deprecated_member_use
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ignore: deprecated_member_use
            ElevatedButton(
              onPressed: () {
                signOut();
                print('Sign Out Success');
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeRest()));
              },
              child: const Text(
                '    Ok    ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppStyle().fontColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {Navigator.pop(context)},
              child: const Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppStyle().darkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
