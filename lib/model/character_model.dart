import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final String char;
  final int frequency;

  const CharacterModel({required this.char, required this.frequency});

  @override
  String toString() {
    return "char : $char | repetition : $frequency";
  }

  @override
  List<Object?> get props => [char, frequency];
}
