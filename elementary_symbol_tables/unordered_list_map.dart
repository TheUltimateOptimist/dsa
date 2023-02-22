import 'custom_map.dart';
import 'pair.dart';

class UnorderedListMap<Key, Value> extends CustomMap<Key, Value> {
  final content = List<Pair<Key, Value>>.empty(growable: true);
  @override
  Value? get(Key key) {
    for (var pair in content) {
      if (pair.key == key) {
        return pair.value;
      }
    }
    return null;
  }

  @override
  bool hasKey(Key key) => content.any((pair) => pair.key == key);

  @override
  bool get isEmpty => content.isEmpty;

  @override
  Iterable<Key> get keys => content.map<Key>((pair) => pair.key);

  @override
  void put(Key key, value) {
    for (var pair in content) {
      if (pair.key == key) {
        pair.value = value;
        return;
      }
    }
    content.add(Pair(key, value));
  }

  @override
  void remove(Key key) => content.removeWhere((pair) => pair.key == key);

  @override
  int get size => content.length;

  @override
  String toString() {
    return "UnorderedListMap($content)";
  }
}
