import cn.hutool.core.util.StrUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: T
 * @program: yk-project
 * @description:
 * @author: yk
 * @create: 2021-02-21 15:34
 */
public class T {

    public static void main(String[] args) {

        //
        String str = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsieWtfc3lzdGVtIl0sInVzZXJfbmFtZSI6InVzZXIiLCJzY29wZSI6WyJST0xFX0FETUlOIiwiUk9MRV9BUEkiXSwiZXhwIjoxNjE4MjI2MzY2LCJhdXRob3JpdGllcyI6WyJzZWxlY3RkIl0sImp0aSI6IjJlZDliMmUwLWIwNTgtNDAwNS05OTIwLTU0Y2QzNzhmODA1ZCIsImNsaWVudF9pZCI6InN5c3RlbSJ9.xcNwIvdUYEN25i78-FjQTqM1RZI9wQ4TEAkYeh6toBw";
        int length = str.length();
        System.out.println("length = " + length);

        String sub = StrUtil.sub(str, 7, str.length());
        System.out.println("sub = " + sub);

        Map<String, String> map = new HashMap<>();
        map.put("aaa","");

        System.out.println("aaa\tbbb");

    }
}
    
    