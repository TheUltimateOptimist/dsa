import 'board.dart';
import 'search_node.dart';
import 'min_binary_heap.dart';

void main(List<String> args) {
  final solver = Solver(Board([[1,3,2], [5,4,6], [7, 0, 8]],));
  print(solver.moves());
}

class Solver {

    // find a solution to the initial board (using the A* algorithm)
    Solver(this.initial);

    final Board initial;

    // // is the initial board solvable? (see below)
    // bool isSolvable();

    // min number of moves to solve initial board; -1 if unsolvable
    int moves(){
      if(!initial.solvable){
        return -1;
      }
      final gameTree = MinBinaryHeap<SearchNode>();
      gameTree.insert(SearchNode(board: initial, moves: 0));
      while(true){
        print("sdf");
        final min = gameTree.delMin();
        if(min.board.isGoal()){
          return min.moves;
        }
        else{
          final neighbors = min.board.neighbors();
          for(final neighbor in neighbors){
            gameTree.insert(SearchNode(board: neighbor, moves: min.moves + 1));
          }
        }
      }
    }

    // sequence of boards in a shortest solution; null if unsolvable
    Iterable<Board>? solution(){
      if(!initial.solvable){
        return null;
      }
      final sequence = List<Board>.empty(growable: true);
      final gameTree = MinBinaryHeap<SearchNode>();
      gameTree.insert(SearchNode(board: initial, moves: 0));
      while(true){
        print("sdf");
        final min = gameTree.delMin();
        sequence.add(min.board);
        if(min.board.isGoal()){
          return sequence;
        }
        else{
          final neighbors = min.board.neighbors();
          for(final neighbor in neighbors){
            gameTree.insert(SearchNode(board: neighbor, moves: min.moves + 1));
          }
        }
      }
    }

}