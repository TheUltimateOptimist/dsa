package queues_stacks;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class StackLinkedListImpl<T> extends Stack<T>{
    private Node first = null;
    private int size = 0;

    private class Node{
        T item;
        Node next;
    }

    @Override
    public void push(T item) {
        Node newNode = new Node();
        newNode.item = item;
        newNode.next = first;
        first = newNode;
        size++;
    }

    @Override
    public T pop() throws NoSuchElementException{
        if(size == 0){
            throw new NoSuchElementException("The Stack is already empty");
        }
        T lastFirstItem = first.item;
        first = first.next;
        size--;
        return lastFirstItem;
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