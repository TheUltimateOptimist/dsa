import 'dart:math';

import 'median_binary_heap.dart';

void main(List<String> args) {
  Random rand = new Random();
  // List<int> randomList = List.empty(growable: true);
  // for(int i = 0; i < 10000; i++){
  //   randomList.add(rand.nextInt(1000));
  // }
  List<int> randomList = [1,2,3, 4, 4];
  print(randomList);
  final medianPQ = MedianBinaryHeap<int>();
  for(var value in randomList){
    medianPQ.insert(value);
  }
  print(medianPQ.median);
}