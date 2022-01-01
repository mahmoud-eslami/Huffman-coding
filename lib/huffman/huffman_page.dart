// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:huffman_code/const/styles.dart';
import 'package:huffman_code/global_widget/text_widget.dart';
import 'package:huffman_code/huffman/huffman_controller.dart';
import 'package:huffman_code/model/character_model.dart';
import 'package:collection/collection.dart';
import 'package:huffman_code/model/node_model.dart';

class HuffmanPage extends StatefulWidget {
  const HuffmanPage({Key? key}) : super(key: key);

  @override
  _HuffmanPageState createState() => _HuffmanPageState();
}

class _HuffmanPageState extends State<HuffmanPage> {
  TextEditingController inputController = TextEditingController();
  HuffmanController controller = HuffmanController();
  List<CharacterModel> characterAnalyzeList = [];
  PriorityQueue<NodeModel> pq = PriorityQueue<NodeModel>();

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
    controller.finalCharactersCode.clear();
    pq.clear();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: inputController,
                maxLength: null,
                maxLines: null,
                decoration: const InputDecoration(
                  label: Text(
                    "Enter input here ...",
                    style: hintStyle,
                  ),
                ),
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
                        onPressed: () async {
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
                            // get frequency of data
                            List<CharacterModel> analyzedData = controller
                                .analyzeInputMessage(inputController.text);
                            characterAnalyzeList = analyzedData;
                            // create node queue
                            var queue =
                                controller.createNodeQueueFromCharacterList(
                                    characterAnalyzeList);
                            // assign values to pq
                            pq =
                                await controller.createHuffmanCodingTree(queue);

                            // clear list to fill new data
                            controller.finalCharactersCode.clear();

                            // parse huffman tree
                            await controller.parseFinalNode(
                                pq.first, "", [], characterAnalyzeList);

                            print(controller.finalCharactersCode);

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
              sizedBox(),
              if (pq.isNotEmpty) huffmanTreeWidget(),
            ],
          ),
        ),
      );

  huffmanTreeWidget() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
            width: 2.2,
          ),
        ),
        child: Center(
          child: Text(pq.toString()),
        ),
      );

  inputAnalyzeWidget() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
            width: 2.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              textWidget(
                "Characters repetition count",
                style: bodyStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox(),
              Wrap(
                children: [
                  for (var i = 0; i < characterAnalyzeList.length; i++)
                    Text(
                      "[${characterAnalyzeList[i].char}:${characterAnalyzeList[i].frequency.toString()}]    ",
                      style: const TextStyle(fontSize: 20),
                    ),
                ],
              ),
              sizedBox(),
            ],
          ),
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
