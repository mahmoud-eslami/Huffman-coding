import 'package:huffman_code/model/character_model.dart';
import 'package:collection/collection.dart';
import 'package:huffman_code/model/node_model.dart';

class HuffmanController {
  List<CharacterModel> analyzeInputMessage(String message) {
    List<String> chars = [];

    for (var element in message.runes) {
      String character = String.fromCharCode(element);
      if (!chars.contains(character)) chars.add(character);
    }
    var finalList = characterModelList(message, chars);
    finalList.sort();
    return finalList;
  }

  List<CharacterModel> characterModelList(String message, List<String> chars) {
    List<CharacterModel> characters = [];
    for (var element in chars) {
      var count = element.allMatches(message).length;
      characters.add(CharacterModel(char: element, frequency: count));
    }

    return characters;
  }

  PriorityQueue<NodeModel> createNodeQueueFromCharacterList(
      List<CharacterModel> cList) {
    PriorityQueue<NodeModel> queue = PriorityQueue<NodeModel>();

    /// fill queue with characters
    for (var element in cList) {
      queue.add(NodeModel(frequency: element.frequency, name: element.char));
    }

    return queue;
  }

  Future createHuffmanCodingTree(PriorityQueue<NodeModel> queue) async {
    PriorityQueue<NodeModel> tempQueue = queue;
    if (tempQueue.length > 1) {
      /// get items from queue to create new node
      NodeModel item1 = getLowestFrequencyNode(tempQueue);
      tempQueue.remove(item1);
      NodeModel item2 = getLowestFrequencyNode(tempQueue);
      tempQueue.remove(item2);

      /// create new node
      NodeModel newNode = NodeModel(
          frequency: item2.frequency + item1.frequency,
          name: item1.name + item2.name,
          lNode: item1,
          rNode: item2);

      /// add new node to queue
      tempQueue.add(newNode);

      createHuffmanCodingTree(tempQueue);
    }
    return queue;
  }

  NodeModel getLowestFrequencyNode(PriorityQueue<NodeModel> queue) {
    List nodeList = queue.toList();
    return nodeList.last;
  }

  getDepth(NodeModel rootNode, List dataList) {
    var tempList = dataList;
    print("started");
    if (rootNode.lNode == null && rootNode.rNode == null) {
      print("finished");
      return tempList;
    } else if (rootNode.lNode == null && rootNode.rNode != null) {
      var list = [null, rootNode.rNode];
      print(tempList);
      tempList.add(list);
      getDepth(rootNode.rNode!, tempList);
    } else if (rootNode.lNode != null && rootNode.rNode == null) {
      print(tempList);

      var list = [rootNode.lNode, null];
      tempList.add(list);
      getDepth(rootNode.lNode!, tempList);
    } else {
      print(tempList);

      var list = [rootNode.lNode, rootNode.rNode];
      tempList.add(list);
      getDepth(rootNode.rNode!, tempList);
      getDepth(rootNode.lNode!, tempList);
    }
  }

  List parseFinalNode(NodeModel rootNode) {
    List<List<NodeModel>> dataList = [];

    return [];
  }
}
