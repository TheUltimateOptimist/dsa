package queues_stacks;

public class TestStacks {
    public static void main(String[] args) {
        StackLinkedListImpl<Integer> linkedListStack = new StackLinkedListImpl<Integer>();
        StackArrayImpl<Integer> arrayStack = new StackArrayImpl<Integer>(100);
        StackResizingArrayImpl<Integer> resizingArrayStack = new StackResizingArrayImpl<Integer>();
        Object[] stacks = {linkedListStack, arrayStack, resizingArrayStack};
        for(int i = 0; i < 100; i++){
            linkedListStack.push(i);
            arrayStack.push(i);
            resizingArrayStack.push(i);
        }
        System.out.println(linkedListStack.size());
        System.out.println(arrayStack.size());
        System.out.println(resizingArrayStack.size());
        System.out.println(linkedListStack.isEmpty());
        System.out.println(arrayStack.isEmpty());
        System.out.println(resizingArrayStack.isEmpty());
        for(Object stack : stacks){
            for(int item : (Stack<Integer>) stack){
                System.out.print(item + " ");
            }
            System.out.print("\n");
        }
        System.out.println(linkedListStack.size());
        System.out.println(arrayStack.size());
        System.out.println(resizingArrayStack.size());
        System.out.println(linkedListStack.isEmpty());
        System.out.println(arrayStack.isEmpty());
        System.out.println(resizingArrayStack.isEmpty());

        for(int i = 0; i < 100; i++){
            System.out.print(linkedListStack.pop() + " ");
            System.out.print(arrayStack.pop() + " ");
            System.out.print(resizingArrayStack.pop() + "\n");
        }

        System.out.println(linkedListStack.size());
        System.out.println(arrayStack.size());
        System.out.println(resizingArrayStack.size());
        System.out.println(linkedListStack.isEmpty());
        System.out.println(arrayStack.isEmpty());
        System.out.println(resizingArrayStack.isEmpty());
    }
}
