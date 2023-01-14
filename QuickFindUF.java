public class QuickFindUF {
    private int[] elements;
    
    public QuickFindUF(int n){
        elements = new int[n];
        for(int i = 0; i < n; i++){
            elements[i] = i;
        }
    }
    boolean connected(int p, int q){
        return elements[p] == elements[q];
    }

    void union(int p, int q){
        if(!connected(p, q)){
            int complexToChangeId = elements[q];
            for(int i = 0; i < elements.length; i++){
                if(elements[i] == complexToChangeId){
                    elements[i] = elements[p];
                }
            }
        }
    }
}
