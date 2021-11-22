import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restsuitapp/screens/welcom.dart';
import 'package:restsuitapp/utility/app_style.dart';
import 'package:restsuitapp/utility/normal_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String user = '', email = '', password = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        // ignore: deprecated_member_use
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffebb327)),
        child: ListView(
          padding: const EdgeInsets.all(50.0),
          children: <Widget>[
            AppStyle().mySizebox50(),
            AppStyle().showLogo(),
            AppStyle().mySizebox(),
            showCreateAccount(),
            AppStyle().mySizebox(),
            AppStyle().mySizebox(),
            emailForm(),
            AppStyle().mySizebox(),
            passwordForm(),
            AppStyle().mySizebox(),
            signinButton(),
            AppStyle().mySizebox(),
          ],
        ),
      ),
    );
  }

  Widget signinButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 250.0, height: 55.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.person,
          size: 30.0,
        ),
        label: const Text(
          " Sign In",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        onPressed: () {
          if (email == '' &&
              email.isEmpty &&
              password == '' &&
              password.isEmpty) {
            norDialog(
                context, 'Please enter your E-mail and Password to Signin.');
          } else if (email == '' || email.isEmpty) {
            print('Have Space');
            norDialog(context, 'Please enter your E-mail');
          } else if (password == '' || password.isEmpty) {
            norDialog(context, 'Please enter your password');
          } else {
            print('email = $email,password = $password');
            registerThread();
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Future<void> registerThread() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Welcome()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        norDialog(context, 'Incorrect password please try again');
      } else if (e.code == 'user-not-found') {
        norDialog(context, 'This E-mail is not registered.');
      } else {
        print(e.code);
        print(e.message);
      }
    }
  }

  Widget showCreateAccount() {
    return Text(
      'Sign In \nAccount',
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
    );
  }

  Widget emailForm() => SizedBox(
        width: 250.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => email = value.toLowerCase(),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.mail_outline,
              color: Colors.red.shade400,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.bold),
            labelText: 'E-mail :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

  Widget passwordForm() => SizedBox(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.toLowerCase(),
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.vpn_key_outlined,
              color: Colors.red.shade400,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.bold),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

  Future<void> gotoSignIn(BuildContext context, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(message),
        children: <Widget>[
          // ignore: deprecated_member_use
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: TextStyle(color: AppStyle().darkColor),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
