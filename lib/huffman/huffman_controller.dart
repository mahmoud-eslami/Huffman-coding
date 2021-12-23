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
}
