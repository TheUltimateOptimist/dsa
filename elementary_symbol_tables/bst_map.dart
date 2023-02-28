import 'custom_map.dart';
import 'ordered_operations.dart';

class Node<Key, Value> {
  Node(this.key, this.value, {this.left, this.right});
  Key key;
  Value value;
  int count = 1;
  Node<Key, Value>? left;
  Node<Key, Value>? right;
}

class BSTMap<Key extends Comparable, Value> extends Iterable<Key> with Iterator<Key>
    implements CustomMap<Key, Value>, OrderedOperations<Key, Value>{
  Node<Key, Value>? root;
  Node<Key, Value>? _currentNode;
  Key? _currentValue;

  BSTMap.initial(this.root) : _currentNode = root;

  @override
  Value? get(Key key) {
    Node? x = root;
    while (x != null) {
      int cmp = key.compareTo(x.key);
      if (cmp < 0)
        x = x.left;
      else if (cmp > 0)
        x = x.right;
      else
        return x.value;
    }
    return null;
  }

  @override
  bool hasKey(Key key) => get(key) != null;

  @override
  bool get isEmpty => root == null;

  @override
  int get size => _getSize(root);

  int _getSize(Node<Key, Value>? x) {
    if (x == null) return 0;
    return x.count;
  }

  @override
  Iterable<Key> get keys {
    List<Key> keys = List<Key>.empty(growable: true);
    _addKeys(root, keys);
    return keys;
  }

  void _addKeys(Node<Key, Value>? x, List<Key> keys) {
    if (x == null) return;
    _addKeys(x.left, keys);
    keys.add(x.key);
    _addKeys(x.right, keys);
  }

  @override
  void put(Key key, Value value) {
    root = _put(root, key, value);
  }

  Node<Key, Value> _put(Node<Key, Value>? x, Key key, Value value) {
    if (x == null) return Node(key, value);
    int cmp = key.compareTo(x.key);
    if (cmp < 0)
      x.left = _put(x.left, key, value);
    else if (cmp > 0)
      x.right = _put(x.right, key, value);
    else
      x.value = value;
    x.count = 1 + _getSize(x.left) + _getSize(x.right);
    return x;
  }

  @override
  void remove(Key key) {
    root = _remove(root, key);
  }

  ///hibbard deletion
  Node<Key, Value>? _remove(Node<Key, Value>? x, Key key) {
    if (x == null) return null;
    int cmp = key.compareTo(x.key);
    if (cmp < 0)
      x.left = _remove(x.left, key);
    else if (cmp > 0)
      x.right = _remove(x.right, key);
    else {
      if (x.right == null) return x.left; //no right child
      if (x.left == null) return x.right; //no left child

      Node<Key, Value> t = x;
      x = _min(t.right!);
      x.right = _deleteMin(t.right!);
      x.left = t.left;
    }
    x.count = _getSize(x.left) + _getSize(x.right) + 1; //update subtree counts
    return x;
  }

  Node<Key, Value> _min(Node<Key, Value> x) {
    if (x.left == null) {
      return x;
    }
    return _min(x.left!);
  }

  @override
  Key? ceiling(Key key) {
    Node<Key, Value>? x = _ceiling(root, key);
    if (x == null) return null;
    return x.key;
  }

  Node<Key, Value>? _ceiling(Node<Key, Value>? x, Key key) {
    if (x == null) return null;
    int cmp = key.compareTo(x.key);
    if (cmp == 0) return x;
    if (cmp > 0) return _ceiling(x.right, key);
    Node<Key, Value>? t = _ceiling(x.left, key);
    if (t != null)
      return t;
    else
      return x;
  }

  @override
  void deleteMax() {
    assert(root != null);
    root = _deleteMax(root!);
  }

  Node<Key, Value>? _deleteMax(Node<Key, Value> x) {
    if (x.right == null) return x.right;
    x.right = _deleteMax(x.right!);
    x.count = 1 + _getSize(x.left) + _getSize(x.right);
    return x;
  }

  @override
  void deleteMin() {
    assert(root != null);
    root = _deleteMin(root!);
  }

  Node<Key, Value>? _deleteMin(Node<Key, Value> x) {
    if (x.left == null) return x.right;
    x.left = _deleteMin(x.left!);
    x.count = 1 + _getSize(x.left) + _getSize(x.right);
    return x;
  }

  @override
  Key? floor(Key key) {
    Node<Key, Value>? x = _floor(root, key);
    if (x == null) return null;
    return x.key;
  }

  Node<Key, Value>? _floor(Node<Key, Value>? x, Key key) {
    if (x == null) return null;
    int cmp = key.compareTo(x.key);
    if (cmp == 0) return x;
    if (cmp < 0) return _floor(x.left, key);
    Node<Key, Value>? t = _floor(x.right, key);
    if (t != null)
      return t;
    else
      return x;
  }

  @override
  Iterable<Key> keysInRange(Key low, Key high) {
    List<Key> keys = List.empty(growable: true);
    _addKeysRange(root, low, high, keys);
    return keys;
  }

  void _addKeysRange(Node<Key, Value>? x, Key low, Key high, List<Key> keys) {
    if (x == null) return;
    int lowCmp = low.compareTo(x.key);
    int highCmp = high.compareTo(x.key);
    if (lowCmp == 1 || highCmp == -1) return; //means is not in range
    _addKeysRange(x.left, low, high, keys);
    keys.add(x.key);
    _addKeysRange(x.right, low, high, keys);
  }

  @override
  Key max() {
    assert(root != null);
    return _maxKey(root!);
  }

  Key _maxKey(Node<Key, Value> x) {
    if (x.left == null) return x.key;
    return _maxKey(x.left!);
  }

  @override
  Key min() {
    assert(root != null);
    return _minKey(root!);
  }

  Key _minKey(Node<Key, Value> x) {
    if (x.left == null) return x.key;
    return _minKey(x.left!);
  }

  @override
  int rank(Key key) {
    if (root == null) return 0;
    return _rank(root!, key);
  }

  int _rank(Node<Key, Value>? x, Key key) {
    if (x == null) return 0;
    int cmp = key.compareTo(x.key);
    if (cmp < 0) return _rank(x.left, key);
    if (cmp > 0)
      return 1 + _getSize(x.left) + _rank(x.right, key);
    else
      return _getSize(x.left); //cmp == 0
  }

  @override
  Key? select(int k) {
    final x = _select(root, k);
    if (x == null) return null;
    return x.key;
  }

  Node<Key, Value>? _select(Node<Key, Value>? x, int k) {
    if (x == null) return null;
    int leftSize = _getSize(x.left);
    if (leftSize < k) return _select(x.right, k - 1 - leftSize);
    if (leftSize > k)
      return _select(x.left, k);
    else
      return x; //leftSize == k
  }

  bool isBST() => _isBST(root, null, null);

  bool _isBST(Node<Key, Value>? x, Key? min, Key? max){
    if(x == null) return true;
    if(min != null && min.compareTo(x.key) >= 0) return false;
    if(max != null && max.compareTo(x.key) <= 0) return false;
    var leftIs = _isBST(x.left, min, x.key);
    var rightIs = _isBST(x.right, x.key, max);
    if(leftIs && rightIs) return true;
    return false;
  }
  
  @override
  Iterator<Key> get iterator => BSTMap.initial(root);
  
  @override
  Key get current => _currentValue!;
  
  @override
  bool moveNext() {
    //morris traversal
    while(_currentNode != null){
      if(_currentNode!.left == null){
        _currentValue = _currentNode!.key;
        _currentNode = _currentNode!.right;
        return true;
      }
      else{
        //find the predecessor
        Node<Key, Value> predecessor = _currentNode!.left!;
        while(predecessor.right != _currentNode && predecessor.right != null){
          predecessor = predecessor.right!;
        }
        if(predecessor.right == null){
          predecessor.right = _currentNode;
          _currentNode = _currentNode!.left;
        }
        else{
          predecessor.right = null;
          _currentValue = _currentNode!.key;
          _currentNode = _currentNode!.right;
          return true;
        }
      }
    }
    return false;
  } 

  
}
