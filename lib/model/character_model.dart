class CharacterModel {
  final String char;
  final int repetition;

  CharacterModel({required this.char, required this.repetition});

  @override
  String toString() {
    return "char : $char | repetition : $repetition";
  }
}
