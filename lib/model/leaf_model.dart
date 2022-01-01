import 'package:equatable/equatable.dart';

class LeafModel extends Equatable with Comparable {
  final String char;
  final int frequency;
  final String code;

  const LeafModel(
      {required this.char, required this.frequency, required this.code});

  @override
  String toString() {
    return "char : $char | repetition : $frequency | code : $code";
  }

  //Being able to compare objects in Dart often involves having to override the == operator as well as hashCode.
  @override
  List<Object?> get props => [char, frequency, code];

  @override
  int compareTo(other) {
    if (frequency < other.frequency) {
      return 1;
    } else if (frequency == other.frequency) {
      return 0;
    } else {
      return -1;
    }
  }
}
