abstract class OrderedOperations<Key extends Comparable, Value>{
  ///smallest key
  Key min();

  ///largest key
  Key max();

  ///largest key less than or equal to key
  Key floor(Key key);

  ///smallest key greater than or equal to key
  Key ceiling(Key key);

  ///number of keys less than key
  int rank(Key key);

  ///key of rank k
  Key select(int k);

  ///delete smallest key
  void deleteMin();

  ///delete largest key
  void deleteMax();

  ///number of keys in [low..high]
  ///
  ///low and high are inclusive
  Iterable<Key> keysInRange(Key low, Key high);
}