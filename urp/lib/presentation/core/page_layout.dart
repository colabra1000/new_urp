import "package:flutter/material.dart";
import 'package:urp/presentation/core/global_variables.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  const PageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(Colors.green.shade800, BlendMode.colorBurn),
              image: backgroundImage,
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
        ),
        body: child,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
