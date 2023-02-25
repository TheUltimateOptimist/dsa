import 'custom_map.dart';
import 'ordered_operations.dart';
import 'pair.dart';

class BinarySearchMap<Key extends Comparable, Value>
    implements CustomMap<Key, Value>, OrderedOperations<Key, Value> {
  final _content = List<Pair<Key, Value>>.empty(growable: true);

  @override
  int rank(Key key) {
    int low = 0; 
    int high = size - 1;
    while(low <= high){
      int middle = (low + high) ~/ 2;
      if(key.compareTo(_content[middle].key) == -1){
        high = middle - 1;
      }
      else if(key.compareTo(_content[middle].key) == 1){
        low = middle + 1;
      }
      else{
        return middle;
      }
    }
    return low;
  }


  @override
  Value? get(Key key) {
    if (isEmpty) return null;
    int i = rank(key);
    if(i < size && _content[i].key.compareTo(key) == 0){
      return _content[i].value;
    }
    return null;
  }

  @override
  bool hasKey(Key key) {
    var value = get(key);
    return value != null;
  }

  @override
  bool get isEmpty => _content.isEmpty;

  @override
  Iterable<Key> get keys => _content.map((pair) => pair.key);

  @override
  void put(Key key, Value value) {
    var keyRank = rank(key);
    if (_content.isEmpty || keyRank >= size) {
      _content.add(Pair(key, value));
      return;
    }
    if(_content[keyRank].key.compareTo(key) == 0){
      _content[keyRank].value = value;
    }
    else{
      _content.insert(keyRank, Pair(key, value));
    }
  }

  @override
  void remove(Key key) {
    assert(!isEmpty, "Error: Can not remove from an empty map");
    assert(_content.any((pair) => pair.key == key),
        "Error: Can not remove an element that does not exist");
    var keyRank = rank(key);
    _content.removeAt(keyRank);
  }

  @override
  int get size => _content.length;

  @override
  Key ceiling(Key key) {
    assert(!isEmpty);
    var keyRank = rank(key);
    assert(keyRank < size);
    return _content[keyRank].key;
  }

  @override
  void deleteMax() => _content.removeLast();

  @override
  void deleteMin() => _content.removeAt(0);

  @override
  Key floor(Key key) {
    assert(!isEmpty);
    var keyRank = rank(key);
    if(keyRank == 0){
      assert(key.compareTo(_content[keyRank].key) >= 0);
      return _content[keyRank].key;
    }
    return _content[keyRank - 1].key;
  }

  @override
  Key max() => _content.last.key;

  @override
  Key min() => _content.first.key;

  @override
  Key select(int k) => _content[k].key;

  @override
  Iterable<Key> keysInRange(Key low, Key high) {
   var start = rank(low);
   var end = rank(high);
   if(end < size && low.compareTo(_content[end].key) == 0){
    end++;
   }
   return _content.sublist(start, end).map((pair) => pair.key);
}
}