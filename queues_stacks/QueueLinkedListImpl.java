package queues_stacks;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class QueueLinkedListImpl<T> extends Queue<T>{
    protected Node first, last;
    protected int size = 0;

    protected class Node{
        T item;
        Node next;
    }

    @Override
    public void enqueue(T item) {
        Node oldLast = last;
        last = new Node();
        last.item = item;
        if(isEmpty()){
            first = last;
        }
        else{
            oldLast.next = last;
        }
        size++;
    }

    @Override
    public T dequeue() throws NoSuchElementException{
        if(isEmpty()){
            throw new NoSuchElementException();
        }
        T result = first.item;
        first = first.next;
        size--;
        return result;
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

        private Node current = first;

        @Override
        public boolean hasNext() {
            return current != null;
        }

        @Override
        public T next() {
            T item = current.item;
            current = current.next;
            return item;
        }
    }
}
