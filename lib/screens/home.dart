import 'package:flutter/material.dart';
import 'package:restsuitapp/screens/createaccount.dart';
import 'package:restsuitapp/screens/signin.dart';
import 'package:restsuitapp/utility/app_style.dart';

class HomeRest extends StatefulWidget {
  const HomeRest({Key? key}) : super(key: key);

  @override
  _HomeRestState createState() => _HomeRestState();
}

class _HomeRestState extends State<HomeRest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/egg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppStyle().showLogo(),AppStyle().mySizebox25(),
              AppStyle().showAppName(),
              AppStyle().mySizebox50(),
              signInButton(),
              AppStyle().mySizebox(),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 250.0, height: 60.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.person,
          size: 30.0,
        ),
        label: const Text(
          " Sign In",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.white),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const SignIn());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xfff08802),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 250.0, height: 60.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.person_add_alt_1,
          size: 30.0,
        ),
        label: const Text(
          " Sign Up ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const CreateAccount());
          Navigator.of(context).push(materialPageRoute);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        const SizedBox(
          width: 5.0,
        ),
        signUpButton(),
      ],
    );
  }
}
