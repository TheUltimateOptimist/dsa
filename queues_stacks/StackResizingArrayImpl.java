package queues_stacks;

import java.util.NoSuchElementException;

public class StackResizingArrayImpl<T> extends StackArrayImpl<T>{

    public StackResizingArrayImpl() {
        super(1);
    }

    @Override
    public T pop() throws NoSuchElementException {
        T result = super.pop();
        if(super.current < super.array.length/4){
            halfArray();
        }
        return result;
    }

    @Override
    public void push(T item) {
        if(super.current == super.array.length - 1){
            doubleArray();
        }
        super.push(item);
    }

    private void doubleArray(){
        Object[] newArray = new Object[super.array.length*2];
        for(int i = 0; i < super.array.length; i++){
            newArray[i] = super.array[i];
        }
        super.array = newArray;
    }  

    private void halfArray(){
        Object[] newArray = new Object[super.array.length/2];
        for(int i = 0; i < super.array.length/4; i++){
            newArray[i] = super.array[i];
        }
        super.array = newArray;
    }
}
