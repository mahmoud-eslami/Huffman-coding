class CharacterModel {
  final String char;
  final int frequency;

  CharacterModel({required this.char, required this.frequency});

  @override
  String toString() {
    return "char : $char | repetition : $frequency";
  }
}
