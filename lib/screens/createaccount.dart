import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restsuitapp/models/user_model.dart';
import 'package:restsuitapp/screens/home.dart';
//import 'package:restsuitapp/screens/signin.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:restsuitapp/utility/app_style.dart';
import 'package:restsuitapp/utility/normal_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String name = '', user = '', email = '', password = '', confirmpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
            AppStyle().showLogo(), AppStyle().mySizebox(), showCreateAccount(),
            AppStyle().mySizebox(),
            AppStyle().mySizebox(),
            //nameText(),MyStyle().mySizebox(),
            userNameForm(), AppStyle().mySizebox(), emailForm(),
            AppStyle().mySizebox(),
            passwordForm(), AppStyle().mySizebox(), confirmpasswordForm(),
            AppStyle().mySizebox(), signupButton(), AppStyle().mySizebox(),
          ],
        ),
      ),
    );
  }

  Widget signupButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 250.0, height: 55.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.person_add_alt_1,
          size: 30.0,
        ),
        label: const Text(
          " Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        onPressed: () {
          if (name == '' ||
              name.isEmpty ||
              email == '' ||
              email.isEmpty ||
              password == '' ||
              password.isEmpty ||
              confirmpassword == '' ||
              confirmpassword.isEmpty) {
            print('Have Space');
            norDialog(context, 'Please fill out the information completely.');
          } else if (password != confirmpassword) {
            norDialog(context, 'Passwords do not match');
          } else {
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
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user!.updateDisplayName(name).then((value2) async {
          String uid = value.user!.uid;
          print('Update Profile Success and uid = $uid');
          UserModle model = UserModle(name: name, email: email);
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('restname')
              .doc(uid)
              .set(data)
              .then((value) => print('insert success'));
          succeedDialog(context, 'User registration is successful.');
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        norDialog(context, 'This email address is already registered.');
      } else if (e.code == 'weak-password') {
        norDialog(
            context, 'Password must contain at least 6 letters or numbers.');
      } else if (e.code == 'invalid-email') {
        norDialog(context, 'Your email format is invalid.');
      } else {
        norDialog(context, '$e'.toString());
        print(e.code);
        print(e.message);
      }
    }
  }

  Widget showCreateAccount() {
    return Text(
      'Create \nAccount',
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

  Widget userNameForm() => SizedBox(
        width: 250.0,
        child: TextField(
          onChanged: (value) => name = value.toLowerCase(),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.account_box_outlined,
              color: Colors.red.shade400,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.normal),
            labelText: 'User Name :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

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
                color: AppStyle().fontColor, fontWeight: FontWeight.normal),
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
                color: AppStyle().fontColor, fontWeight: FontWeight.normal),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

  Widget confirmpasswordForm() => SizedBox(
        width: 250.0,
        child: TextField(
          onChanged: (value) => confirmpassword = value.toLowerCase(),
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.vpn_key_outlined,
              color: Colors.red.shade400,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.normal),
            labelText: 'Confirm password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );
}

Future<void> succeedDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Center(
        child: Text(message),
      ),
      children: <Widget>[
        // ignore: deprecated_member_use
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => const HomeRest());
                Navigator.of(context).push(materialPageRoute);
              },
              child: Text(
                'OK',
                style: TextStyle(color: AppStyle().darkColor),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
