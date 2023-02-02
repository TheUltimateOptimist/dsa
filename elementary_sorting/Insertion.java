package elementary_sorting;

import util.Sorting;

public class Insertion {
    public static void sort(Comparable[] a){
        int n = a.length;
        for(int i = 1; i < n; i++){
            for(int j = i; j > 0; j--){
                if(Sorting.less(a[j], a[j - 1])){
                    Sorting.exch(a, j, j - 1);
                }else{
                    break;
                }
            }
        }
    }
}
