import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urp/presentation/core/global_variables.dart';
import 'package:urp/presentation/core/page_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: cacLogo),
          ),
          Text(
            "Welcome to the Official Company"
            " Registration Portal (CRP) of the Corporate"
            " Affairs Commission, Federal Republic of Nigeria.",
            style: GoogleFonts.lora(
              textStyle: bigText,
            ),
            textAlign: TextAlign.justify,
          ),
          smallSpacing,
          cupertinoButton(
            label: "login",
            onPressed: () {},
          ),
          smallSpacing,
          cupertinoButton(
            label: "Public User Registration",
            onPressed: () {},
          ),
          smallSpacing,
          cupertinoButton(
            label: "Accredited User Registration",
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
