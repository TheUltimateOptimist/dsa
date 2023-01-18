package elementary_sorting;

import java.util.Random;

public class LinearShuffle{
    public static void shuffle(Object[] array){
        Random random = new Random();
        for(int i = 1; i < array.length; i++){
            int newIndex = random.nextInt(i + 1);
            exch(array, i, newIndex);
        }
    }

    private static void exch(Object[] a, int i, int j) {
        Object swap = a[i];
        a[i] = a[j];
        a[j] = swap;
    }
}
