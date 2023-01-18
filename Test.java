import elementary_sorting.Insertion;
import elementary_sorting.LinearShuffle;
import elementary_sorting.Selection;
import elementary_sorting.ShellSort;


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
        workingArray = unsortedArray.clone();
        System.out.println("Unsorted: " + Util.toString(workingArray));
        ShellSort.sort(workingArray);
        System.out.println("Sorted: " + Util.toString(workingArray));
        workingArray = unsortedArray.clone();
        System.out.println("Unshuffled: " + Util.toString(workingArray));
        LinearShuffle.shuffle(workingArray);
        System.out.println("Shuffled: " + Util.toString(workingArray));
    }
}
