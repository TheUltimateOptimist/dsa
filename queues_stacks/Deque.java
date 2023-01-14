package queues_stacks;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class Deque<T> implements Iterable<T> {

    private Node first, last;
    private int size = 0;

    private class Node{
        T item;
        Node next_left;
        Node next_right;
    }

    // is the deque empty?
    public boolean isEmpty(){
        return size == 0;
    }

    // return the number of items on the deque
    public int size(){
        return size;
    }

    // add the item to the front
    public void addFirst(T item){
        if(item == null){
            throw new IllegalArgumentException();
        }
        Node oldFirst = first;
        first = new Node();
        first.item = item;
        if(isEmpty()){
            last = first;
        }
        else{
            oldFirst.next_right = first;
            first.next_left = oldFirst;
        }
        size++;
    }

    // add the item to the back
    public void addLast(T item){
        if(item == null){
            throw new IllegalArgumentException();
        }
        Node oldLast = last;
        last = new Node();
        last.item = item;
        if(isEmpty()){
            first = last;
        }
        else{
            oldLast.next_left = last;
            last.next_right = oldLast;
        }
        size++;
    }

    // remove and return the item from the front
    public T removeFirst(){
        if(isEmpty()){
            throw new NoSuchElementException();
        }
        T item = first.item;
        if(first.next_left == null){
            first = null;
            last = null;
        }
        else{
            first.next_left.next_right = null;
            first = first.next_left;
        }
        size--;
        return item;
    }

    // remove and return the item from the back
    public T removeLast(){
        if(isEmpty()){
            throw new NoSuchElementException();
        }
        T item = last.item;
        if(last.next_right == null){
            last = null;
            first = null;
        }
        else{
            last.next_right.next_left = null;
            last = last.next_right;
        }
        size--;
        return item;
    }

    // return an iterator over items in order from front to back
    public Iterator<T> iterator(){
        return new ListIterator();
    }

    private class ListIterator implements Iterator<T>{

        Node current = first;

        @Override
        public boolean hasNext() {
            return current != null;
        }

        @Override
        public T next() {
            if(!hasNext()){
                throw new NoSuchElementException();
            }
            T result = current.item;
            current = current.next_left;
            return result;
        }
    }

    // unit testing (required)
    public static void main(String[] args){
        Deque<Integer> dequeue = new Deque<Integer>();
        System.out.println(dequeue.size());
        System.out.println(dequeue.isEmpty());
        for(int i = 0; i < 50; i++){
            dequeue.addFirst(i);
        }
        System.out.println(dequeue.size());
        System.out.println(dequeue.isEmpty());
        for(int j = 0; j < 50; j++){
            dequeue.addLast(j);
        }
        System.out.println(dequeue.size());
        System.out.println(dequeue.isEmpty());
        for(int number : dequeue){
            System.out.print(number + " ");
        }
        System.out.print("\n");
        System.out.println(dequeue.size());
        System.out.println(dequeue.isEmpty());
        for(int i = 0; i < 50; i++){
            System.out.print(dequeue.removeFirst() + " ");
            System.out.print(dequeue.removeLast() + " ");
        }
        System.out.println(dequeue.size());
        System.out.println(dequeue.isEmpty());
    }
}
