//import 'unordered_max_pq.dart';
import 'binary_heap.dart';
import 'dart:math';

void main(List<String> args) {
  final bh = BinaryHeap<int>();
  Random rand = new Random();
  for(int i = 0; i < 100; i++){
    bh.insert(rand.nextInt(1000));
  }
  for(int i = 0; i < 10; i++){
    print(bh.delMax());
  }
}