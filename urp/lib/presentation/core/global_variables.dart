import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = "iii";

//colors
const primaryColor = Colors.green;
final lightColor = Colors.grey.shade100;

//images
const backgroundImage = AssetImage("assets/images/background.jpg");
const cacLogo = AssetImage("assets/images/cac-logo.png");

//textStyles
const bigText = TextStyle(fontSize: 28);
const mediumText = TextStyle(fontSize: 20);

//spacing
const smallSpacing = SizedBox(height: 20);

//buttons
Widget cupertinoButton({required String label, required Function() onPressed}) {
  return SizedBox(
    width: double.infinity,
    // child: TextButton.icon(
    //   onPressed: onPressed,
    //   icon: const Icon(Icons.person),
    //   style: ButtonStyle(
    //       textStyle: MaterialStateProperty.all(mediumText),
    //       backgroundColor: MaterialStateProperty.all(primaryColor),
    //       foregroundColor: MaterialStateProperty.all(lightColor)),
    //   label: Text(
    //     label,
    //     style: GoogleFonts.lora(textStyle: mediumText),
    //   ),
    // ),

    child: CupertinoButton(
      color: primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.person),
          Text(
            label,
            style: GoogleFonts.lora(textStyle: mediumText),
          ),
        ],
      ),
      onPressed: onPressed,
    ),
  );
}
