package quicksort;

import edu.princeton.cs.algs4.StdRandom;

public class Quicksort {
    private static boolean isSorted(Comparable[] a) {
        for (int i = 1; i < a.length; i++)
            if (less(a[i], a[i - 1]))
                return false;
        return true;
    }

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
                exch(array, lt++, i++);
            }
            else if(cmp < 0){
                exch(array, i, gt--);
            }
            else{
                i++;
            }
        }

        sort(array, low, lt - 1);
        sort(array, gt + 1, high);
    }
}
