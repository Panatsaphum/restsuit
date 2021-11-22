import 'package:flutter/material.dart';
import 'package:restsuitapp/utility/app_style.dart';
import 'package:restsuitapp/utility/normal_dialog.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  String foodName = '', description = '', price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppStyle().redColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Add new Menu',
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
      ),
      backgroundColor: const Color(0xffebb327),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffebb327)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //profile(),
                AppStyle().mySizebox50(),
                AppStyle().mySizebox50(), showAddPhoto(),
                AppStyle().mySizebox(),
                addPhotoButton(), AppStyle().mySizebox(), foodNameForm(),
                AppStyle().mySizebox(), priceForm(), AppStyle().mySizebox(),
                descriptionForm(), AppStyle().mySizebox(), addMenuButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addMenuButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 250.0,
      height: 55.0,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.post_add,
          size: 35.0,
        ),
        label: const Text(
          " Add Menu ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          norDialog(context, 'Add New Menu Success !!!');
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

  Widget addPhotoButton() {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 200.0, height: 55.0,
      //width: 300.0, height: 150.0,
      // ignore: deprecated_member_use
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.add_photo_alternate,
          size: 35.0,
        ),
        label: const Text(
          "Add Photo ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Color(0xfff08802),
          ),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff006e71),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget foodNameForm() => SizedBox(
        width: 250.0,
        child: TextField(
          onChanged: (value) => foodName = value.toLowerCase(),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            helperText: '* Please enter the name of the food ',
            helperStyle: TextStyle(color: AppStyle().fontColor),
            prefixIcon: Icon(
              Icons.lunch_dining,
              color: Colors.red.shade400,
              size: 35,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.bold),
            labelText: 'Food Name :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

  Widget descriptionForm() => SizedBox(
        width: 250.0,
        child: TextField(
          maxLines: 4,
          onChanged: (value) => description = value.toLowerCase(),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.normal),
            labelText: 'Description ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );

  Widget priceForm() => SizedBox(
        width: 250.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => price = value.toLowerCase(),
          decoration: InputDecoration(
            suffixText: '฿',
            suffixStyle: const TextStyle(color: Colors.red, fontSize: 15),
            fillColor: Colors.white,
            filled: true,
            helperText: '* Please enter the Price of the food ',
            helperStyle: TextStyle(color: AppStyle().fontColor),
            prefixIcon: Icon(
              Icons.local_offer,
              color: Colors.red.shade400,
              size: 35,
            ),
            labelStyle: TextStyle(
                color: AppStyle().fontColor, fontWeight: FontWeight.bold),
            labelText: 'Price :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppStyle().fontColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400)),
          ),
        ),
      );


  Widget showTitleSetting() {
    return Text(
      ' Add New \n Menu ',
      textAlign: TextAlign.center,
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

  Row showAddPhoto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 250,
          height: 150,
          child: Image.asset('images/photo.png'),
        )
      ],
    );
  }
}
