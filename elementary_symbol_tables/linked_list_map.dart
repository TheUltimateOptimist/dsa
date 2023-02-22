import 'custom_map.dart';

class _Node<Key, Value> {
  _Node({this.next, required this.key, required this.value});
  _Node<Key, Value>? next;
  Key key;
  Value value;
}

///unordered
class LinkedListMap<Key, Value> implements CustomMap<Key, Value> {
  _Node<Key, Value>? root;
  int size = 0;

  @override
  Value? get(Key key) {
    return _get(root, key);
  }

  _get(_Node<Key, Value>? current, Key key) {
    if (current == null) {
      return null;
    }
    if (current.key == key) {
      return current.value;
    }
    return _get(current.next, key);
  }

  @override
  bool hasKey(Key key) {
    return _hasKey(root, key);
  }

  bool _hasKey(_Node<Key, Value>? current, Key key) {
    if (current == null) {
      return false;
    }
    if (current.key == key) {
      return true;
    }
    return _hasKey(current.next, key);
  }

  @override
  bool get isEmpty => size == 0;

  @override
  Iterable<Key> get keys {
    final result = List<Key>.empty(growable: true);
    _collectKeys(root, result);
    return result;
  }

  void _collectKeys(_Node<Key, Value>? current, List<Key> keyList) {
    if (current != null) {
      keyList.add(current.key);
      _collectKeys(current.next, keyList);
    }
  }

  @override
  void put(Key key, value) {
    _put(root, key, value);
  }

  void _put(_Node<Key, Value>? current, Key key, Value value) {
    if (current == null) {
      final root = this.root;
      this.root = _Node(key: key, value: value, next: root);
      size++;
    } else if (current.key == key) {
      current.value = value;
    } else {
      _put(current.next, key, value);
    }
  }

  @override
  void remove(Key key) {
    _remove(null, root, key);
  }

  void _remove(
      _Node<Key, Value>? previous, _Node<Key, Value>? current, Key key) {
    if (current != null && current.key == key) {
      if (previous == null) {
        root = current.next;
      } else {
        previous.next = current.next;
      }
      size--;
    } else if (current != null && current.key != key) {
      _remove(current, current.next, key);
    }
  }

  @override
  String toString() {
    if (isEmpty) {
      return "LinkedListMap()";
    }
    String result = "LinkedListMap(";
    result = result + "${root!.key}:${root!.value}";
    return "${_toString(root!.next, result)})";
  }

  String _toString(_Node<Key, Value>? current, String result) {
    if (current == null) {
      return result;
    }
    return _toString(current.next, "$result, ${current.key}:${current.value}");
  }
}
