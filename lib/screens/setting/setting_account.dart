import 'package:flutter/material.dart';
import 'package:restsuitapp/utility/app_style.dart';

class SettingAccount extends StatefulWidget {
  const SettingAccount({Key? key}) : super(key: key);

  @override
  _SettingAccountState createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  String newPassWord = '', conPassWord = '', oldPassWord = '', passWord = '';
  @override
  Widget build(BuildContext context) {
    const userName = 'KANUM';
    const userEmail = 'Test@gmail.com';
    const urlImage =
        'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        // ignore: deprecated_member_use
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text(
          'Setting Account',
          style: TextStyle(
            fontSize: 35.0,
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
        decoration: const BoxDecoration(
          color: Color(0xffebb327),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            AppStyle().mySizebox50(),
            //AppStyle().showLogo(),
            AppStyle().mySizebox(), AppStyle().mySizebox(),
            AppStyle().mySizebox(),
            buildHeader(
                urlImage: urlImage, userName: userName, userEmail: userEmail),
            const Divider(
              color: Colors.transparent,
              thickness: 0.5,
              indent: 10,
              height: 20,
              endIndent: 10,
            ),
            changePasswordForm(),
            const Divider(
              color: Colors.transparent,
              height: 20.0,
            ),
            deleteAccountButton(),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String userName,
    required String userEmail,
  }) =>
      InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20).add(
            const EdgeInsets.symmetric(
              vertical: 18.0,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 42,
                        ),
                       
                      ],
                    ),
                    radius: 45,
                    backgroundImage: NetworkImage(urlImage),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                      ),
                      Text(
                        userEmail,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.transparent,
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30.0,
                    width: 57.0,
                  ),
                  SizedBox(
                    height: 30.0,
                    width: 90.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  // ignore: non_constant_identifier_names

  Widget changePasswordForm() => Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0).add(
          const EdgeInsets.symmetric(vertical: 18.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              AppStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (value) => oldPassWord = value.toLowerCase(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                        labelText: 'Old Password:',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (value) => newPassWord = value.toLowerCase(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                        labelText: 'New Password:',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                  ),
                ],
              ),
              AppStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (value) => conPassWord = value.toLowerCase(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                        labelText: 'Confirm Password:',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppStyle().mySizebox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                    width: 300.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget deleteAccountButton() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
            width: 300.0,
            child: ElevatedButton(
              onPressed: () {
                deleteAcDialog1(context, 'Do you want to delete your account?');
              },
              child: const Text(
                'Delete Account',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
              ),
            ),
          ),
        ],
      );

  Future<void> deleteAcDialog(BuildContext context, String meassage) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        title: Center(
          child: Text(meassage),
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 230.0,
                height: 50.0,
                child: TextField(
                  onChanged: (value) => passWord = value.toLowerCase(),
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    labelStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppStyle().mySizebox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Delete',
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
                  primary: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> deleteAcDialog1(BuildContext context, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        title: Center(
          child: Text(message),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.pop(context),
                  deleteAcDialog(context,
                      'Please enter your password to delete your account.')
                },
                child: const Text(
                  '  Yes  ',
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
                  primary: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

