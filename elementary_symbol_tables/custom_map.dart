import 'binary_search_map.dart';
import 'linked_list_map.dart';
import 'unordered_list_map.dart';

void main(List<String> args) {
  final linkedListMap = LinkedListMap<int, int>();
  final unorderedListMap = UnorderedListMap<int, int>();
  final binarySearchMap = BinarySearchMap<int, int>();
  testMap(binarySearchMap);
}

abstract class CustomMap<Key, Value>{
  void put(Key key, Value value);
  Value? get(Key key);
  void remove(Key key);
  bool hasKey(Key key);
  bool get isEmpty;
  int get size;
  Iterable<Key> get keys;
}

void testMap(CustomMap<int, int> map){
  for(int i = 0; i < 10; i++){
    map.put(i, i);
  }
  print(map.hasKey(5));
  print(map.get(5));
  print(map.hasKey(100));
  print(map.get(100));
  print(map.keys);
  print(map);
  print(map.size);
  for(int i = 0; i < 10; i++){
    map.remove(i);
  }
  print(map.keys);
  print(map);
  print(map.size);
  print(map.hasKey(2));
  print(map.get(2));

}