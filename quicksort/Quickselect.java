package quicksort;

import edu.princeton.cs.algs4.StdRandom;
import util.Sorting;

public class Quickselect {
    private static int partition(Comparable[] array, int low, int high){
        int i = low, j = high+1;
        while (true){
            while(Sorting.less(array[++i], array[low])){
                if(i == high){
                    break;
                }
            }

            while(Sorting.less(array[low], array[--j])){
                if(j == low){
                    break;
                }
            }
            if(i >= j){
                break;
            }
            Sorting.exch(array, i, j);
        }
        Sorting.exch(array, low, j);
        return j;
    }
    public static Comparable select(Comparable[] array, int k){
        StdRandom.shuffle(array);
        int low = 0, high = array.length - 1;
        while(high > low){
            int j = partition(array, low, high);
            if(j < k){
                low = j + 1;
            }
            else if(j > k){
                high = j - 1;
            }
            else{
                return array[k];
            }
        }
        return array[k];
    }
}
