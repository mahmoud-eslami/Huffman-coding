import 'package:huffman_code/model/character_model.dart';

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
      characters.add(CharacterModel(char: element, repetition: count));
    }

    return characters;
  }
}
