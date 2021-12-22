// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:huffman_code/const/styles.dart';
import 'package:huffman_code/huffman/huffman_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  textWidget(
    text, {
    style,
    isCenter = true,
  }) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: style,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: textWidget(
              "Huffman Coding",
              style: titleStyle,
            )),
            textWidget(
              "Teacher name : Mahmoud yaghoubi",
              style: bodyStyle,
            ),
            textWidget(
              "Developer : Mahmoud Eslami",
              style: bodyStyle,
            ),
            textWidget(
              "impelementation of huffman coding",
              style: hintStyle,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: textWidget("Start"),
                style: ElevatedButton.styleFrom(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
