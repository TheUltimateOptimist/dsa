class Pair<Key, Value> {
  Pair(this.key, this.value);
  Key key;
  Value value;

  @override
  String toString() {
    return "$key:$value";
  }
}