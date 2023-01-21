package quicksort;

import edu.princeton.cs.algs4.StdRandom;

public class Quickselect {
    private static void exch(Comparable[] a, int i, int j) {
        Comparable swap = a[i];
        a[i] = a[j];
        a[j] = swap;
    }

    private static boolean less(Comparable v, Comparable w) {
        return v.compareTo(w) < 0;
    }
    private static int partition(Comparable[] array, int low, int high){
        int i = low, j = high+1;
        while (true){
            while(less(array[++i], array[low])){
                if(i == high){
                    break;
                }
            }

            while(less(array[low], array[--j])){
                if(j == low){
                    break;
                }
            }
            if(i >= j){
                break;
            }
            exch(array, i, j);
        }
        exch(array, low, j);
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
