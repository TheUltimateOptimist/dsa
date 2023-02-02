import 'unordered_max_pq.dart';
import 'dart:math';

void main(List<String> args) {
  final pq = UnorderedMaxPQ<int>();
  Random rand = new Random();
  for(int i = 0; i < 100; i++){
    pq.insert(rand.nextInt(1000));
  }
  for(int i = 0; i < 10; i++){
    print(pq.delMax());
  }
}