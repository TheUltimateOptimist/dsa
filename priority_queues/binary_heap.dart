import 'dart:svg';

import '../util/sorting.dart';

class BinaryHeap<Key extends Comparable>{
  BinaryHeap() : _content = List<Key>.empty(growable: true);

  List<Key> _content;

  int _parentIndex(int nodeIndex){
    return nodeIndex ~/ 2;
  }

  int _leftChildIndex(int nodeIndex){
    return nodeIndex*2;
  }

  int _rightChildIndex(int nodeIndex){
    return nodeIndex*2 + 1;
  }

  void _swim(int nodeIndex){
    while(nodeIndex > 1 && less<Key>(_content[_parentIndex(nodeIndex)], _content[nodeIndex])){
      exch(_content, _parentIndex(nodeIndex), nodeIndex);
      nodeIndex = _parentIndex(nodeIndex);
    };
  }

  void _sink(int nodeIndex){
    while(_leftChildIndex(nodeIndex) <= _content.length){
      int leftChildIndex = _leftChildIndex(nodeIndex);
      int rightChildIndex = _rightChildIndex(nodeIndex);
      Key leftChildValue = _content[leftChildIndex];
      Key rightChildValue = _content[rightChildIndex];
      int childIndex = leftChildIndex;
      Key childValue = leftChildValue;
      if(leftChildIndex < _content.length && less<Key>(leftChildValue, rightChildValue)){
        childIndex = rightChildIndex;
        childValue = rightChildValue;
      }
      if(!less<Key>(_content[nodeIndex], childValue)){
        break;
      }
      exch<Key>(_content, nodeIndex, childIndex);
      nodeIndex = childIndex;
    }


  }

  void insert(Key item){
    _content.add(item);
    _swim(_content.length - 1);
  }
}