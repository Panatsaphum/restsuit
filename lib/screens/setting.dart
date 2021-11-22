import 'package:flutter/material.dart';
import 'package:restsuitapp/screens/setting/add_menu.dart';
import 'package:restsuitapp/utility/app_style.dart';

class SetTing extends StatefulWidget {
  const SetTing({Key? key}) : super(key: key);

  @override
  _SetTingState createState() => _SetTingState();
}

class _SetTingState extends State<SetTing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        // ignore: deprecated_member_use
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: Text(
          'Setting ',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //profile(),
              addMenuButton(), AppStyle().mySizebox(), editMenuButton(),
              AppStyle().mySizebox(), setTableButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget addMenuButton() {
    return SizedBox(
      width: 300.0,
      height: 150.0,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.post_add,
          size: 50.0,
        ),
        label: const Text(
          " Add New \n    Menu ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const AddMenu());
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

  Widget editMenuButton() {
    return SizedBox(
      width: 300.0,
      height: 150.0,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.edit,
          size: 50.0,
        ),
        label: const Text(
          " Edit Menu ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const AddMenu());
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

  Widget setTableButton() {
    return SizedBox(
      width: 300.0,
      height: 150.0,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.deck,
          size: 50.0,
        ),
        label: const Text(
          " Set Tables ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Color(0xfff08802)),
        ),
        onPressed: () {
          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => const AddMenu());
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
}
