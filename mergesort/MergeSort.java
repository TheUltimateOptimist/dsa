package mergesort;

public class MergeSort {
    private static boolean isSorted(Comparable[] a, int start, int end) {
        assert start >= 0;
        assert start < a.length;
        assert end >= 0;
        assert end < a.length;
        if (start == end) {
            return true;
        }
        for (int i = start + 1; i <= end; i++)
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

    private static void merge(Comparable[] origin, Comparable[] copyOver, int low, int mid, int high) {
        assert isSorted(origin, low, mid);
        assert isSorted(origin, mid + 1, high);

        // copy
        for (int k = low; k <= high; k++) {
            copyOver[k] = origin[k];
        }

        // merge
        int firstLow = low;
        int secondLow = mid + 1;
        for (int k = firstLow; k <= high; k++) {
            if (firstLow > mid) {
                origin[k] = copyOver[secondLow];
                secondLow++;
            } else if (secondLow > high) {
                origin[k] = copyOver[firstLow];
                firstLow++;
            } else if (less(copyOver[secondLow], copyOver[firstLow])) {
                origin[k] = copyOver[secondLow];
                secondLow++;
            } else {
                origin[k] = copyOver[firstLow];
                firstLow++;
            }
        }

        assert isSorted(origin, low, high);
    }

    private static void sort(Comparable[] origin, Comparable[] copyOver, int low, int high){
        if(high <= low){
            return;
        }
        int mid = low + (high - low) / 2;
        sort(origin, copyOver, mid + 1, high);
        sort(origin, copyOver, mid + 1, high);
        merge(origin, copyOver, low, mid, high);
    }

    public static void sort(Comparable[] origin){
        Comparable[] copyOver = new Comparable[origin.length];
        sort(origin, copyOver, 0, origin.length - 1);
    }
}
