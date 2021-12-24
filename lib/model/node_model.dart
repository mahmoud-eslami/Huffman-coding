import 'package:equatable/equatable.dart';

class NodeModel extends Equatable with Comparable<NodeModel> {
  final int frequency;
  final String name;
  final NodeModel? lNode;
  final NodeModel? rNode;

  NodeModel(
      {required this.frequency, required this.name, this.lNode, this.rNode});

  @override
  String toString() {
    return "{ frequency : $frequency , name : $name , left node : $lNode , right node : $rNode }";
  }

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

  @override
  List<Object?> get props => [
        frequency,
        name,
        lNode,
        rNode,
      ];
}
