import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String alertTitle;
  final String alertContent;
  final String type;
  final Function? yesButton;

  const CustomAlertDialog(
      {super.key,
      required this.type,
      required this.alertTitle,
      required this.alertContent,
      this.yesButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alertTitle),
      content: Text(alertContent),
      actions: [
        type == "Yes"
            ? ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 228, 183, 79),
                  foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('No'),
              )
            : Container(),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (type == "Yes" && yesButton != null) {
                yesButton!();
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 174, 46),
                foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            child: Text(type)),
      ],
    );
  }
}
