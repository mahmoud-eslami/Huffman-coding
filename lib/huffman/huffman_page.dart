import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huffman_code/const/styles.dart';
import 'package:huffman_code/global_widget/text_widget.dart';
import 'package:huffman_code/huffman/huffman_controller.dart';
import 'package:huffman_code/model/character_model.dart';

class HuffmanPage extends StatefulWidget {
  const HuffmanPage({Key? key}) : super(key: key);

  @override
  _HuffmanPageState createState() => _HuffmanPageState();
}

class _HuffmanPageState extends State<HuffmanPage> {
  TextEditingController inputController = TextEditingController();
  HuffmanController controller = HuffmanController();
  List<CharacterModel> characterAnalyzeList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  clearFunction() {
    inputController.clear();
    characterAnalyzeList.clear();
    setState(() {});
  }

  sizedBox() => const SizedBox(
        height: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Huffman Coding"),
        ),
        body: body());
  }

  body() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: inputController,
              decoration: const InputDecoration(
                label: Text(
                  "Enter input here ...",
                  style: hintStyle,
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              style: bodyStyle,
            ),
            sizedBox(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (inputController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please enter an input :D",
                                style: bodyStyle,
                              ),
                            ),
                          );
                        } else {
                          List<CharacterModel> analyzedData = controller
                              .analyzeInputMessage(inputController.text);
                          characterAnalyzeList = analyzedData;
                          var queue =
                              controller.createNodeQueueFromCharacterList(
                                  characterAnalyzeList);
                          controller.getLowestFrequencyNode(queue);
                          setState(() {});
                        }
                      },
                      child: textWidget(
                        "Analyze",
                        style: buttonStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        clearFunction();
                      },
                      child: textWidget(
                        "Clear",
                        style: buttonStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizedBox(),
            if (characterAnalyzeList.isNotEmpty) inputAnalyzeWidget(),
          ],
        ),
      );

  inputAnalyzeWidget() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
            width: 2.2,
          ),
        ),
        child: Column(
          children: [
            sizedBox(),
            textWidget(
              "Characters repetition count",
              style: bodyStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(),
            for (var i = 0; i < characterAnalyzeList.length; i++)
              textWidget(
                characterAnalyzeList[i].char +
                    " : " +
                    characterAnalyzeList[i].frequency.toString(),
                style: bodyStyle,
              ),
            sizedBox(),
          ],
        ),
      );

  resultWidget() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
            width: 2.2,
          ),
        ),
        child: Column(
          children: [
            sizedBox(),
            textWidget(
              "Characters repetition count",
              style: bodyStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox(),
            // todo : put result here
            sizedBox(),
          ],
        ),
      );
}
