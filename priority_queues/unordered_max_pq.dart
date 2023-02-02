import '../util/sorting.dart';

class UnorderedMaxPQ<Key extends Comparable>{
  UnorderedMaxPQ() : _pq = List<Key>.empty(growable: true);
  List<Key> _pq;

  bool isEmpty(){
    return _pq.isEmpty;
  }

  void insert(Key x){
    _pq.add(x);
  }

  Key delMax(){
    int max = 0;
    for(int i = 0; i < _pq.length; i++){
      if(less(_pq[max], _pq[i])){
        max = i;
      }
    }
    exch<Key>(_pq, max, _pq.length - 1);
    return _pq.removeLast();
  }
}