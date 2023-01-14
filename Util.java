public class Util {
    public static String toString(Object[] array){
        String result = "";
        for(int i = 0; i < array.length; i++){
            if(i > 0){
                result += ", ";
            }
            result += array[i].toString();
        }
        return result;
    }
}
