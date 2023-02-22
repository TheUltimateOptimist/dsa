import 'custom_map.dart';
import 'pair.dart';

class BinarySearchMap<Key extends Comparable, Value>
    implements CustomMap<Key, Value> {
  final _content = List<Pair<Key, Value>>.empty(growable: true);

  ///returns index of the given key
  ///
  ///-1 -> given key is smaller than all of the keys
  ///
  ///-2 -> given key is greater than all of the keys
  int _index(Key key, int low, int high) {
    if(low == high && _content[low].key != key){
      return low == 0 && _content[low].key.compareTo(key) == 1 ? -1 : -2;
    }
    else if(low == high){
      return low;
    }
    var middle = low + (high - low) ~/ 2;
    int cmp = key.compareTo(_content[middle].key);
    if (cmp < 0) {
      return _index(key, low, middle - 1);
    } else if (cmp > 0) {
      return _index(key, middle + 1, high);
    } else {
      return middle;
    }
  }

  @override
  Value? get(Key key) {
    if (isEmpty) {
      return null;
    }
    var index = _index(key, 0, size - 1);
    return index >= 0 ? _content[index].value : null;
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
    if (_content.isEmpty) {
      _content.add(Pair(key, value));
      return;
    }
    var index = _index(key, 0, size - 1);
    if(index == -1){
      _content.insert(0, Pair(key, value));
    }
    else if(index == -2){
      _content.add(Pair(key, value));
    }
    else{
      _content[index].value = value;
    }
  }

  @override
  void remove(Key key) {
    assert(!_content.isEmpty, "Error: Can not remove from an empty map");
    assert(_content.any((pair) => pair.key == key),
        "Error: Can not remove an element that does not exist");
    var rank = _index(key, 0, size - 1);
    _content.removeAt(rank);
  }

  @override
  int get size => _content.length;
}
