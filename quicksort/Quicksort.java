package quicksort;

import edu.princeton.cs.algs4.StdRandom;
import util.Sorting;

public class Quicksort {
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

    public static void sort(Comparable[] array){
        StdRandom.shuffle(array);
        sort(array, 0, array.length - 1);
    }

    private static void sort(Comparable[] array, int low, int high){
        if(high <= low)return;
        int j = partition(array, low, high);
        sort(array, low, j - 1);
        sort(array, j + 1, high);
    }

    private static void threeWaySort(Comparable[] array, int low, int high){
        if(high <= low){
            return;
        }
        int lt = low, gt = high;
        Comparable v = array[low];
        int i = low;
        while(i <= gt){
            int cmp = array[i].compareTo(v);
            if(cmp < 0){
                Sorting.exch(array, lt++, i++);
            }
            else if(cmp < 0){
                Sorting.exch(array, i, gt--);
            }
            else{
                i++;
            }
        }

        sort(array, low, lt - 1);
        sort(array, gt + 1, high);
    }
}
