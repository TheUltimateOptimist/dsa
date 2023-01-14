import sorting.Selection;
import sorting.Insertion;


public class Test {
    public static void main(String[] args){
        Comparable[] unsortedArray = {9,8,7,6,5,4,3,2,1};
        System.out.println("Unsorted: " + Util.toString(unsortedArray));
        Comparable[] workingArray = unsortedArray.clone();
        Selection.sort(workingArray);
        System.out.println("Sorted: " + Util.toString(workingArray));
        workingArray = unsortedArray.clone();
        System.out.println("Unsorted: " + Util.toString(workingArray));
        Insertion.sort(workingArray);
        System.out.println("Sorted: " + Util.toString(workingArray));
    }
}
