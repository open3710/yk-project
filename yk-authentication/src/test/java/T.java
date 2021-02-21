import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @ClassName: T
 * @program: yk-project
 * @description:
 * @author: yk
 * @create: 2021-02-21 15:34
 */
public class T {

    public static void main(String[] args) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String secret = bCryptPasswordEncoder.encode("secret");
        System.out.println("secret = " + secret);
    }
}
    
    