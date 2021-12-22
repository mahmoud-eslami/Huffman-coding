import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huffman_code/const/styles.dart';
import 'package:huffman_code/global_widget/text_widget.dart';

class HuffmanPage extends StatefulWidget {
  const HuffmanPage({Key? key}) : super(key: key);

  @override
  _HuffmanPageState createState() => _HuffmanPageState();
}

class _HuffmanPageState extends State<HuffmanPage> {
  sizedBox() => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Huffman Coding"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Enter input here ..."),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
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
                  "Analyze",
                  style: buttonStyle,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
