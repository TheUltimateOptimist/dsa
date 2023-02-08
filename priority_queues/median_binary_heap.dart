import 'max_binary_heap.dart';
import 'min_binary_heap.dart';

class MedianBinaryHeap<Key extends Comparable>{
  final _maxPQ = MaxBinaryHeap<Key>();
  final _minPQ = MinBinaryHeap<Key>();

  void insert(Key key){
    if(_maxPQ.isEmpty()){
      _maxPQ.insert(key);
      _minPQ.insert(key);
    }
    else if(_maxPQ.length < _minPQ.length){
      final endIndex = _maxPQ.insert(key);
      if(endIndex == 0){
        _minPQ.exchangeRootSafe(_maxPQ.max);
        _maxPQ.exchangeRootUnSafe(_minPQ.min);
      }
    }
    else{
      final endIndex = _minPQ.insert(key);
      if(endIndex == 0){
        _maxPQ.exchangeRootSafe(_minPQ.min);
        _minPQ.exchangeRootUnSafe(_maxPQ.max);
      }
    }
  }

  Key get median{
    assert(_maxPQ.max == _minPQ.min);
    return _maxPQ.max;
  }


}