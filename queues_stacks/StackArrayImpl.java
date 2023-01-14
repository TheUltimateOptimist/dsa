package queues_stacks;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class StackArrayImpl<T> extends Stack<T>{
    protected Object[] array;
    protected int current = -1;

    public StackArrayImpl(int size){
        this.array = new Object[size];
    }

    @Override
    public void push(T item) {
        current++;
        array[current] = item;
    }

    @Override
    public T pop() throws NoSuchElementException{
        if(isEmpty()){
            throw new NoSuchElementException("The Stack is already empty");
        }
        T result = (T) array[current];
        array[current] = null;
        current--;
        return result;
    }

    @Override
    public boolean isEmpty() {
        return current == -1;
    }

    @Override
    public int size() {
        return current + 1;
    }

    @Override
    public Iterator<T> iterator() {
        return new ListIterator();
    }

    private class ListIterator implements Iterator<T>{

        private int current_index = current;

        @Override
        public boolean hasNext() {
            return current_index >= 0;
        }
        
        @Override
        public T next() {
            T item = (T) array[current_index];
            current_index--;
            return item;
        }

    }
}
