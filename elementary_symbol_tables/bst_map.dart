import 'custom_map.dart';
import 'ordered_operations.dart';

class Node<Key, Value>{
  Node(this.key, this.value, {this.left, this.right});
  Key key;
  Value value;
  int count = 1;
  Node<Key, Value>? left;
  Node<Key, Value>? right;
}

class BSTMap<Key extends Comparable, Value> implements CustomMap<Key, Value>, OrderedOperations<Key, Value>{

  Node<Key, Value>? root;
  
  @override
  Value? get(Key key) {
    Node? x = root;
    while(x != null){
      int cmp = key.compareTo(x.key);
      if(cmp < 0) x = x.left;
      else if(cmp > 0) x = x.right;
      else return x.value;
    }
    return null;
  }
  
  @override
  bool hasKey(Key key) => get(key) != null;
  
  
  @override
  bool get isEmpty => root == null;

  @override
  int get size => _getSize(root);

  int _getSize(Node<Key, Value>? x){
    if(x == null) return 0;
    return x.count;
  }
  
  @override
  Iterable<Key> get keys{
    List<Key> keys = List<Key>.empty(growable: true);
    _addKeys(root, keys);
    return keys;
  }

  void _addKeys(Node<Key, Value>? x, List<Key> keys){
    if(x == null) return;
    _addKeys(x.left, keys);
    keys.add(x.key);
    _addKeys(x.right, keys);
  }
  
  @override
  void put(Key key, Value value) {
    root = _put(root, key, value);
  }

  Node<Key, Value> _put(Node<Key, Value>? x, Key key, Value value){
    if(x == null) return Node(key, value);
    int cmp = key.compareTo(x.key);
    if(cmp < 0) x.left = _put(x.left, key, value);
    else if(cmp > 0) x.right = _put(x.right, key, value);
    else x.value = value;
    x.count = 1 + _getSize(x.left) + _getSize(x.right);
    return x;
  }
  
  @override
  void remove(Key key) {
    // TODO: implement remove
  }
  
  @override
  Key ceiling(Key key) {
    // TODO: implement ceiling
    throw UnimplementedError();
  }
  
  @override
  void deleteMax() {
    // TODO: implement deleteMax
  }
  
  @override
  void deleteMin() {
    root = _deleteMin(root);
  }

  Node<Key, Value>? _deleteMin(Node<Key, Value> x){
    if(x.left == null) return x.right;
    x.left = _deleteMin(x.left!);
  }
  
  @override
  Key floor(Key key) {
    // TODO: implement floor
    throw UnimplementedError();
  }
  
  @override
  Iterable<Key> keysInRange(Key low, Key high) {
    // TODO: implement keysInRange
    throw UnimplementedError();
  }
  
  @override
  Key max() {
    // TODO: implement max
    throw UnimplementedError();
  }
  
  @override
  Key min() {
    // TODO: implement min
    throw UnimplementedError();
  }
  
  @override
  int rank(Key key) {
    // TODO: implement rank
    throw UnimplementedError();
  }
  
  @override
  Key select(int k) {
    // TODO: implement select
    throw UnimplementedError();
  }
}