public class Percolation{
    private int[][] grid;
    private int[][] sizes;
    private int N;

    private int numberOfOpenSites = 0;
    public Percolation(int n){
        if(n <= 0){
            throw new IllegalArgumentException();
        }
        N = n;
        sizes = new int[n + 1][n];
        sizes[0][0] = 1;
        sizes[0][1] = 1;
        grid = new int[n + 1][n];
        for(int i = 0; i < n + 1; i++){
            for(int j= 0; j < n; j++){
                grid[i][j] = i*n + j;
            }
        }
    }

    private int toRow(int value){
        return value / N;
    }

    private int toCol(int value){
        return value % N;
    }

    private int root(int value) {
        int row = toRow(value);
        int col = toCol(value);
        while (value != grid[row][col]){
            int suggestedRoot = grid[row][col];
            grid[row][col] = grid[toRow(suggestedRoot)][toCol(suggestedRoot)];
            value = grid[row][col];
        }
        return value;
    }

    public void union(int valueOne, int valueTwo) {
        int rootOne = root(valueOne);
        int rootTwo = root(valueTwo);
        if (rootOne == rootTwo)
            return;
        int row1 = toRow(rootOne);
        int col1 = toCol(rootOne);
        int row2 = toRow(rootTwo);
        int col2 = toCol(rootTwo);
        if (sizes[row1][col1] < sizes[row2][col2]) {
            grid[row1][col1] = rootTwo;
            sizes[row2][col2] += sizes[row1][col1];
        } else {
            grid[row2][col2] = rootOne;
            sizes[row1][col1] += sizes[row2][col2];
        }
    }

    public void open(int row, int col){
        if(row < 1 || col < 1){
            throw new IllegalArgumentException();
        }
        if(sizes[row][col - 1] != 0){
            return;
        }
        sizes[row][col - 1] = 1;

        // union links
        if(col > 1 && sizes[row][col - 2] > 0){
            union(grid[row][col - 2], grid[row ][col - 1]);
        }

        //union oben
        if(row > 1 && sizes[row - 1][col - 1] > 0){
            union(grid[row- 1][col - 1], grid[row][col - 1]);
        }

        //union rechts
        if(col < N && sizes[row][col] > 0){
            union(grid[row][col - 1], grid[row ][col]);
        }

        //union unten
        if(row < N && sizes[row + 1][col - 1] > 0){
            union(grid[row + 1][col - 1], grid[row][col - 1]);
        }

        //union virtual nodes
        if(row == 1){
            union(grid[row][col - 1], grid[0][0]);
        }
        if(row == N){
            union(grid[row][col - 1], grid[0][1]);
        }
    }

    public boolean isOpen(int row, int col){
        if(row < 1 || col < 1){
            throw new IllegalArgumentException();
        }
        return sizes[row][col - 1] > 0;
    }

    public boolean isFull(int row, int col){
        if(row < 1 || col < 1){
            throw new IllegalArgumentException();
        }
        return sizes[row][col - 1] == 0;
    }

    public int numberOfOpenSites(){
        return numberOfOpenSites;
    }

    public boolean percolates(){
        return root(grid[0][0]) == root(grid[0][1]);
    }
}