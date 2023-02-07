bool isSorted<Key extends Comparable>(List<Key> a) {
  for (int i = 1; i < a.length; i++) {
    if (less(a[i], a[i - 1])) return false;
  }
  return true;
}

bool less<Key extends Comparable>(Key v, Key w) {
  return v.compareTo(w) < 0;
}

bool larger<Key extends Comparable>(Key v, Key w){
  return v.compareTo(w) > 0;
}

void exch<Key extends Comparable>(List<Key?> a, int i, int j) {
  Key swap = a[i]!;
  a[i] = a[j];
  a[j] = swap;
}
