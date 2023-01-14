package queues_stacks;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class QueueArrayImpl<T> extends Queue<T>{

    protected Object[] array;
    protected int head = -1;
    protected int tail = 0;
    protected int size = 0;

    public QueueArrayImpl(int N){
        this.array = new Object[N];
    }

    @Override
    public void enqueue(T item) {
        array[tail] = item;
        tail++;
        size++;
        if(head == -1){
            head = 0;
        }   
    }

    @Override
    public T dequeue() throws NoSuchElementException{
        if(isEmpty()) throw new NoSuchElementException("The queue is empty");
        T item = (T) array[head];
        head++;
        if(head == tail){
            tail = 0;
            head = -1;
        }
        size--;
        return item;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public int size() {
        return size;
    }
    
    @Override
    public Iterator<T> iterator() {
        return new ListIterator();
    }

    private class ListIterator implements Iterator<T>{

        private int current = head;

        @Override
        public boolean hasNext() {
            return current < tail;
        }
        
        @Override
        public T next() {
            T item = (T) array[current];
            current++;
            return item;
        }

    }
    
}
