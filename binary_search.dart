import 'package:test/test.dart';

int? binarySearch(List<int> sortedList, int value){
  int low = 0; 
  int high = sortedList.length - 1;
  while(low <= high){
    int middle = (low + high) ~/ 2;
    if(sortedList[middle] < value){
      low = middle + 1;
    }
    else if(sortedList[middle] > value){
      high = middle - 1;
    }
    else{
      return middle;
    }
  }
  return null;
}

void main(List<String> args) {
  test("empty list", (){
    expect(binarySearch([], 5), isNull);
  });
  test("not in list", (){
    expect(binarySearch([1,2,3,4,5,6], 7), isNull);
  });
  test("first element 5 total", (){
    expect(binarySearch([1,2,3,4,5], 1), 0);
  });
  test("first element 7 total", (){
    expect(binarySearch([1,2,3,4,5,6,7], 1), 0);
  });
  test("in between element 8 total", (){
    expect(binarySearch([1,5,6,8,9,10, 11, 100], 9), 4);
  });
  test("last element 7 total", (){
    expect(binarySearch([3,5,7,9,10,100,200], 200), 6);
  });
  test("one element", (){
    expect(binarySearch([100], 100), 0);
  });
}


