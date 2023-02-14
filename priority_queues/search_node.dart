import 'board.dart';

class SearchNode implements Comparable<SearchNode>{
  final Board board;
  final int moves;
  final SearchNode? previous;
  SearchNode({
    required this.board,
    required this.moves,
    this.previous,
  });

  SearchNode copyWith({
    Board? board,
    int? moves,
    SearchNode? previous,
  }) {
    return SearchNode(
      board: board ?? this.board,
      moves: moves ?? this.moves,
      previous: previous ?? this.previous,
    );
  }

  @override
  String toString() => 'SearchNode(board: $board, moves: $moves, previous: $previous, hamming: ${board.hamming()})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SearchNode &&
      other.board == board &&
      other.moves == moves &&
      other.previous == previous;
  }

  @override
  int get hashCode => board.hashCode ^ moves.hashCode ^ previous.hashCode;
  
  @override
  int compareTo(SearchNode other) {
    final priority = board.hamming() + moves;
    final otherPriority = other.board.hamming() + moves;
    if(priority < otherPriority){
      return -1;
    }
    else if(priority == otherPriority){
      return 0;
    }
    return 1;
  }
  
 
}
