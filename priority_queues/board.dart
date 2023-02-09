class Board {
  // create a board from an n-by-n array of tiles,
  // where tiles[row][col] = tile at (row, col)
  const Board(this.tiles);

  final List<List<int>> tiles;

  @override
  String toString() {
    var description = tiles.length.toString();
    for (var tileRow in tiles) {
      description += " ${tileRow.join(" ")}";
    }
    return description;
  }

  // // board dimension n
  // public int dimension()

  // number of tiles out of place
  int hamming() {
    int result = 0;
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles.length; j++) {
        var actualValue = tiles[i][j];
        var expectedValue = i * j + j + 1;
        if (actualValue != 0 && actualValue != expectedValue) {
          result++;
        }
      }
    }
    return result;
  }

  // sum of Manhattan distances between tiles and goal
  int manhattan() {
    int result = 0;
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        var value = tiles[row][col];
        var expectedRow = (value - 1) ~/ tiles.length;
        var expectedCol = value - 1 - expectedRow * tiles.length;
        if (row != expectedRow) {
          result += (row - expectedRow).abs();
        }
        if (col != expectedCol) {
          result += (col - expectedCol).abs();
        }
      }
    }
    return result;
  }

  @override
  bool operator ==(Object other) {
    if (other is! Board) {
      return false;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other.tiles.length != tiles.length) {
      return false;
    }
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        if (tiles[row][col] != other.tiles[row][col]) {
          return false;
        }
      }
    }
    return true;
  }

  // is this board the goal board?
  bool isGoal() {
    return hamming() == 0;
  }

  // all neighboring boards
  List<Board> neighbors() {
    var result = List<Board>.empty(growable: true);
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        if (tiles[row][col] != 0) {
          continue;
        }
        if (row > 0) {
          result.add(Board.withExchange(this, row, col, row - 1, col));
        }
        if (row < tiles.length - 1) {
          result.add(Board.withExchange(this, row, col, row + 1, col));
        }
        if (col > 0) {
          result.add(Board.withExchange(this, row, col, row, col - 1));
        }
        if (col < tiles.length - 1) {
          result.add(Board.withExchange(this, row, col, row, col + 1));
        }
      }
    }
    return result;
  }

  factory Board.withExchange(
      Board from, int row1, int col1, int row2, int col2) {
    final newTiles = List<List<int>>.filled(
        from.tiles.length, List<int>.filled(from.tiles.length, 0));
    for (int row = 0; row < from.tiles.length; row++) {
      for (int col = 0; col < from.tiles.length; col++) {
        if (row1 == row && col1 == col) {
          newTiles[row][col] = from.tiles[row2][col2];
        } else if (row2 == row && col2 == col) {
          newTiles[row][col] = from.tiles[row1][col1];
        }
        newTiles[row][col] = from.tiles[row][col];
      }
    }
    return Board(newTiles);
  }

  // // a board that is obtained by exchanging any pair of tiles
  // public Board twin()
}
