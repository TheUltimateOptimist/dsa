import 'dart:convert';

void main(List<String> args) {
  final one = One(one: 1,two: 1);
  final two = One(one: 2, two: 1);
  print(one == two);
}

class One extends Comparable<One>{
  final int one;
  final int two;
  One({
    required this.one,
    required this.two,
  });

  bool operator >(One other){
    return compareTo(other) == 1;
  }

  bool operator <(One other){
    return compareTo(other) == -1;
  }

  One copyWith({
    int? one,
    int? two,
  }) {
    return One(
      one: one ?? this.one,
      two: two ?? this.two,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'one': one,
      'two': two,
    };
  }

  factory One.fromMap(Map<String, dynamic> map) {
    return One(
      one: map['one']?.toInt() ?? 0,
      two: map['two']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory One.fromJson(String source) => One.fromMap(json.decode(source));

  @override
  String toString() => 'One(one: $one, two: $two)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is One && compareTo(other) == 0;
  }

  @override
  int get hashCode => one.hashCode ^ two.hashCode;
  
  @override
  int compareTo(One other) {
    if(one == other.one && two == other.two){
      return 0;
    }
    else if(one < other.one || (one == other.one && two < other.two)){
      return -1;
    }
    return 1;
  }
}
