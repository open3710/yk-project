import sun.misc.JavaAWTAccess;

import java.util.ArrayList;

/**
 * @ClassName: T
 * @program: yk-project
 * @description:
 * @author: yk
 * @create: 2021-04-04 21:01
 */
public class T {



    public static void main(String[] args) {

        ArrayList<String> strings = new ArrayList<>();
        ArrayList<String> stringa = new ArrayList<>();
        strings.add("1");
        strings.add("2");
        strings.add("3");
        strings.add("4");
        strings.stream().filter(f -> !f.equals("1")).map(m-> m+"aaa").forEach(System.out::print);



    }
}

    
    