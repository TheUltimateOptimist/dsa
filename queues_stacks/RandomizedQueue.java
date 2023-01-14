package queues_stacks;

import java.util.Iterator;

import java.util.Random;

public class RandomizedQueue<T> implements Iterable<T>{
    int tail = 0;
    Object[]array = new Object[1];
    int size = 0;
    int TRYS = 3;

    // is the randomized queue empty?
    public boolean isEmpty(){
        return size == 0;
    }

    // return the number of items on the randomized queue
    public int size(){
        return size;
    }

    // add the item
    public void enqueue(T item){
        if(tail >= array.length){
            resize(2*array.length);
        }
        array[tail] = item;
        tail++;
        size++;
    }

    // remove and return a random item
    public T dequeue(){
        int randomIndex = getRandomIndex();
        T item = (T) array[randomIndex];
        array[randomIndex] = null;
        size--;
        return item;
    }

    // return a random item (but do not remove it)
    public T sample(){
        int randomIndex = getRandomIndex();
        return (T) array[randomIndex];
    }

    private int getRandomIndex(){
        Random rand = new Random();
        for(int i = 0; i < TRYS; i++){
            int index = rand.nextInt(tail);
            if(array[index] != null){
                return index;
            } 
        }
        resize(2*size());
        return getRandomIndex();
    }

    private void resize(int newLength){
        Object[] newArray = new Object[newLength];
        int index = 0;
        for(Object element : array){
            if(element != null){
                newArray[index] = element;
                index++;
            }
        }
        array = newArray;
        tail = index;
    }

    // return an independent iterator over items in random order
    public Iterator<T> iterator(){
        return new RandomIterator();
    }

    private class RandomIterator implements Iterator<T>{
        
        Object [] finalArray = new Object[size()];
        int current = 0;

        public RandomIterator(){
            Object[] initialArray = new Object[array.length];
            System.arraycopy(array, 0, initialArray, 0, array.length);
            for(int i = 0; i < size(); i++){
                finalArray[i] = dequeue();
            }
            array = initialArray;
        }

        @Override
        public boolean hasNext() {
            return current < array.length;
        }

        @Override
        public T next() {
            return (T) array[current++];
        } 
    }



    // unit testing (required)
    public static void main(String[] args){
        RandomizedQueue<Integer> queue = new RandomizedQueue<>();
        System.out.println(queue.isEmpty());
        System.out.println(queue.size());
        for(int i = 0; i < 100; i++){
            queue.enqueue(i);
        }
        System.out.println(queue.isEmpty());
        System.out.println(queue.size());
        for(int element : queue){
            System.out.print(element + " ");
        }
        System.out.print("\n");
        System.out.println(queue.isEmpty());
        System.out.println(queue.size());
        for(int i = 0; i < 100; i++){
            System.out.print(queue.dequeue() + " ");
        }
        System.out.print("\n");
        System.out.println(queue.isEmpty());
        System.out.println(queue.size());
    }

}
