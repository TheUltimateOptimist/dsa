package queues_stacks;

import java.util.NoSuchElementException;

public class QueueResizingArrayImpl<T> extends QueueArrayImpl<T>{

    public QueueResizingArrayImpl() {
        super(1);
    }

    @Override
    public void enqueue(T item) {
        if(tail > super.array.length - 1){
            resize(2*super.array.length);
        }
        super.enqueue(item);
    }

    @Override
    public T dequeue() throws NoSuchElementException {
        if(super.tail < super.array.length/4 - 1){
            resize(super.array.length/2);
        }
        return super.dequeue();
    }

    public void resize(int length){
        assert(length >= size());
        Object[] newArray = new Object[length];
        int x = 0;
        for(int i = super.head; i < super.tail; i++){
            newArray[x] = super.array[i];
            x++;
        }
        super.array = newArray;
        super.head = 0;
        super.tail = x;
    }

    
}
