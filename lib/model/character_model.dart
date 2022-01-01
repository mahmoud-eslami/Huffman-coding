import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable with Comparable {
  final String char;
  final int frequency;

  const CharacterModel({required this.char, required this.frequency});

  @override
  String toString() {
    return "char : $char | repetition : $frequency";
  }

  //Being able to compare objects in Dart often involves having to override the == operator as well as hashCode.
  @override
  List<Object?> get props => [char, frequency];

  @override
  int compareTo(other) {
    if (frequency < other.frequency) {
      return -1;
    } else if (frequency == other.frequency) {
      return 0;
    } else {
      return 1;
    }
  }
}
