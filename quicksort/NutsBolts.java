package quicksort;

public class NutsBolts {
    int[] nuts;
    int[] bolts;

    NutsBolts(int[] nuts, int[] bolts) {
        assert(nuts.length == bolts.length);
        assert(everyNutFitsExactlyOneBolt(nuts, bolts));
        this.nuts = nuts;
        this.bolts = bolts;
    }

    private void swap(int[] array, int left, int right){
        int leftValue = array[left];
        array[left] = array[right];
        array[right] = leftValue;
    }

    public void sort(){
        int n = bolts.length;
        int smallest = -1;
        int biggest = -1;
        for(int i = 0; i < n; i++){
            int bolt = bolts[i];
            if(bolt == nuts[i]){
                continue;
            }
            int left = 0; 
            int right = n - 1;
            if(smallest == -1 && biggest != -1){
                if(bolt > nuts[biggest]){
                    left = biggest + 1;
                }
                else if(bolt < nuts[biggest]){
                    right = biggest - 1;
                }
            }
            else if(biggest == -1 && smallest != -1){
                if(bolt > )
            }
            

        }
    }

    private int sortNuts(int bolt, int left, int right){
            int match = -1;
            while(left <= right){
                if(nuts[left] < bolt && match == -1){
                    left++;
                }
                else if(nuts[left] < bolt && match != -1){
                    swap(nuts, left, left - 1);
                    match++;
                    left++;
                }
                else if(nuts[left] == bolt){
                    match = left;
                    left++;
                }
                else if(nuts[left] > bolt){
                    swap(nuts, left, right);
                    right--;
                }
            }
            return match;
    }

    private static boolean everyNutFitsExactlyOneBolt(int[] nuts, int[] bolts){
        for(int nut: nuts){
            int matches = 0;
            for(int bolt: bolts){
                if(bolt == nut){
                    matches++;
                }
            }
            if(matches != 1){
                return false;
            }
        }
        return true;
    }
}
