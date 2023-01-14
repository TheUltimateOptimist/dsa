package queues_stacks;

public class TestQueues {
    public static void main(String[] args) {
        QueueLinkedListImpl<Integer> linkedListQueue = new QueueLinkedListImpl<Integer>();
        QueueArrayImpl<Integer> arrayQueue = new QueueArrayImpl<Integer>(100);
        QueueResizingArrayImpl<Integer> resizingArrayQueue = new QueueResizingArrayImpl<Integer>();
        Object[] queues = {linkedListQueue, arrayQueue, resizingArrayQueue};
        for(int i = 0; i < 100; i++){
            linkedListQueue.enqueue(i);
            arrayQueue.enqueue(i);
            resizingArrayQueue.enqueue(i);
        }
        System.out.println(linkedListQueue.size());
        System.out.println(arrayQueue.size());
        System.out.println(resizingArrayQueue.size());
        System.out.println(linkedListQueue.isEmpty());
        System.out.println(arrayQueue.isEmpty());
        System.out.println(resizingArrayQueue.isEmpty());

        for(Object queue : queues){
            for(int item : (Queue<Integer>) queue){
                System.out.print(item + " ");
            }
            System.out.print("\n");
        }

        System.out.println(linkedListQueue.size());
        System.out.println(arrayQueue.size());
        System.out.println(resizingArrayQueue.size());
        System.out.println(linkedListQueue.isEmpty());
        System.out.println(arrayQueue.isEmpty());
        System.out.println(resizingArrayQueue.isEmpty());

        for(int i = 0; i < 100; i++){
            System.out.print(linkedListQueue.dequeue() + " ");
            System.out.print(arrayQueue.dequeue() + " ");
            System.out.print(resizingArrayQueue.dequeue() + "\n");
        }
        System.out.println(linkedListQueue.size());
        System.out.println(arrayQueue.size());
        System.out.println(resizingArrayQueue.size());
        System.out.println(linkedListQueue.isEmpty());
        System.out.println(arrayQueue.isEmpty());
        System.out.println(resizingArrayQueue.isEmpty());



        QueueResizingArrayImpl<Integer> test = new QueueResizingArrayImpl<Integer>();
        for(int i = 0; i < 100; i++){
            test.enqueue(4);
            test.dequeue();
        }
        test.enqueue(4);
        System.out.println(test.dequeue());
    }
}
