package elementary_sorting;

import util.Sorting;

public class Selection {
     public static void sort(Comparable[] a){
        int n = a.length;
        for(int i = 0; i < n; i++){
            int min = i;
            for(int j = i + 1; j < n; j++){
                if(Sorting.less(a[j], a[min])){
                    min = j;
                }
            }
            Sorting.exch(a, i, min);
        }
    }
}
