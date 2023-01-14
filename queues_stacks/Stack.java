package queues_stacks;

abstract class Stack<T> implements Iterable<T>{
    abstract void push(T item);
    abstract T pop();
    abstract boolean isEmpty();
    abstract int size();
}
