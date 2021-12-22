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
        Expanded(
          child: Text(
            text,
            style: style,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );
  }

  sizedBox() => SizedBox(
        height: 70,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: textWidget(
            "Huffman Coding",
            style: titleStyle,
          )),
          sizedBox(),
          textWidget(
            "Teacher : Mahmoud yaghoubi",
            style: bodyStyle,
          ),
          textWidget(
            "Developer : Mahmoud Eslami",
            style: bodyStyle,
          ),
          sizedBox(),
          textWidget(
            "impelementation of huffman coding algorithm",
            style: hintStyle,
          ),
          sizedBox(),
          SizedBox(
            width: 250,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HuffmanPage(),
                    ));
              },
              child: textWidget(
                "Start",
                style: buttonStyle,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
