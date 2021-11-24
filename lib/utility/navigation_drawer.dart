import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restsuitapp/screens/setting/add_menu.dart';
import 'package:restsuitapp/screens/setting/edit_menu.dart';
import 'package:restsuitapp/screens/setting/set_tables.dart';
import 'package:restsuitapp/screens/setting/setting_account.dart';
import 'package:restsuitapp/screens/welcom.dart';
import 'package:restsuitapp/utility/app_style.dart';

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({Key? key}) : super(key: key);

  @override
  _NavigationDrawerPageState createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  String name = '', email = '';
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  void initState() {
    super.initState();
    findNameAndEmail();
  }

  Future<void> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event!.displayName!;
          email = event.email!;
          print(name);
          print(email);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userName = name;
    final userEmail = email;
    const urlImage =
        'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d';

    return Drawer(
      child: Material(
        color: AppStyle().primaryColor,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              userName: userName,
              userEmail: userEmail,
            ),
            Divider(
              color: AppStyle().fontColor,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => selectdItem(context, 0),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  buildMenuItem(
                    text: 'Add New Menu',
                    icon: Icons.post_add,
                    onClicked: () => selectdItem(context, 1),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  buildMenuItem(
                    text: 'Edit Menu',
                    icon: Icons.edit_outlined,
                    onClicked: () => selectdItem(context, 2),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  buildMenuItem(
                    text: 'Set Tables',
                    icon: Icons.deck,
                    onClicked: () => selectdItem(context, 3),
                  ),
                  const SizedBox(
                    height: 280.0,
                  ),
                  Divider(
                    color: AppStyle().fontColor,
                  ),
                  buildMenuItem(
                    text: 'Setting Account',
                    icon: Icons.settings,
                    onClicked: () => selectdItem(context, 4),
                  ),
                ],
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
          padding: padding.add(
            const EdgeInsets.symmetric(
              vertical: 30.0,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 35,
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
                      style:
                          const TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      userEmail,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = AppStyle().fontColor;
    // forWeb => final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text, style: TextStyle(color: color)),
      //forWeb => hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectdItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Welcome(),
          ),
        );

        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddMenu(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EditMenu(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SetTables(),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SettingAccount(),
          ),
        );
        break;
    }
  }

  Widget settingIconButtton(BuildContext context) {
    return IconButton(
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const SettingAccount());
          Navigator.of(context).push(materialPageRoute);
        },
        icon: const Icon(Icons.settings));
  }
}

