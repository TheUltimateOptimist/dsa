package queues_stacks;

abstract class Queue<T> implements Iterable<T>{
    abstract void enqueue(T item);
    abstract T dequeue();
    abstract boolean isEmpty();
    abstract int size();
}
