class MaxBinaryHeap<Key extends Comparable>{
  MaxBinaryHeap() : _content = List<Key>.empty(growable: true);

  List<Key> _content;

  int _parentIndex(int nodeIndex){
    assert(nodeIndex > 0);
    assert(nodeIndex < _content.length);
    return (nodeIndex - 1) ~/ 2;
  }

  int _leftChildIndex(int nodeIndex){
    assert(nodeIndex >= 0);
    assert(nodeIndex < _content.length - 1);
    if(nodeIndex == 0){
      return 1;
    }
    return nodeIndex*2 + 1;
  }

  int _rightChildIndex(int nodeIndex){
    assert(nodeIndex >= 0);
    assert(nodeIndex < _content.length - 2);
    if(nodeIndex == 0){
      return 2;
    }
    return nodeIndex*2 + 2;
  }

  bool _less(int indexOne, int indexTwo){
    assert(indexOne >= 0 && indexTwo >= 0);
    assert(indexOne < _content.length && indexTwo < _content.length);
    return _content[indexOne].compareTo(_content[indexTwo]) < 0;
  }

  void _exch(int indexOne, int indexTwo) {
  Key swap = _content[indexOne];
  _content[indexOne] = _content[indexTwo];
  _content[indexTwo] = swap;
}

  int _swim(int nodeIndex){
    while(nodeIndex > 0 && _less(_parentIndex(nodeIndex), nodeIndex)){
      _exch(_parentIndex(nodeIndex), nodeIndex);
      nodeIndex = _parentIndex(nodeIndex);
    };
    return nodeIndex;
  }

  void _sink(int nodeIndex){
    while(_leftChildIndex(nodeIndex) < _content.length){
      int leftChildIndex = _leftChildIndex(nodeIndex);
      int rightChildIndex = _rightChildIndex(nodeIndex);
      int childIndex = leftChildIndex;
      if(leftChildIndex < _content.length - 1 && _less(leftChildIndex, rightChildIndex)){
        childIndex = rightChildIndex;
      }
      if(!_less(nodeIndex, childIndex)){
        break;
      }
      _exch(nodeIndex, childIndex);
      nodeIndex = childIndex;
    }
  }

  Key get max{
    assert(_content.length > 0);
    return _content[0];
  }

  int insert(Key item){
    _content.add(item);
    return _swim(_content.length - 1);
  }

  Key delMax(){
    if(_content.isEmpty){
      throw Exception("The binary heap is empty!");
    }
    if(_content.length == 1){
      return _content.removeLast();
    }
    _exch(0, _content.length - 1);
    Key max = _content.removeLast();
    _sink(0);
    return max;
  }

  bool isEmpty(){
    return _content.isEmpty;
  }

  int get length{
    return _content.length;
  }

  void exchangeRootSafe(Key newItem){
    assert(_content.length >= 1);
    _content[0] = newItem;
    _sink(0);
  }

  void exchangeRootUnSafe(Key newItem){
    assert(_content.length >= 1);
    _content[0] = newItem;
  }
}