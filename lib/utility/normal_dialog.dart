import 'package:flutter/material.dart';

Future<void> norDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      title: Center(child: Text(message)),
      children: <Widget>[
        // ignore: deprecated_member_use
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                '   OK   ',
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
