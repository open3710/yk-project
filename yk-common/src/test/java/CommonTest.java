import com.yk.common.util.EncryptUtil;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Base64;
import java.util.Date;

/**
 * @ClassName: CommonTest
 * @program: yk-project
 * @description:
 * @author: yk
 * @create: 2021-04-04 21:48
 */

public class CommonTest {


    public static void main(String[] args) {
       /* String aaa = EncryptUtil.encodeUTF8StringBase64("aaa");
        System.out.println("aaa = " + aaa);
        JwtBuilder jwtBuilder = Jwts.builder()
                .setId("111")
                .setSubject("root")
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.ES256, aaa);
        String compact = jwtBuilder.compact();
        System.out.println("compact = " + compact);*/

        String jwt= "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsieWtfYmxvZyJdLCJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbIlJPTEVfQURNSU4iLCJST0xFX0FQSSJdLCJleHAiOjE2MTc1NTMyMDIsImF1dGhvcml0aWVzIjpbInAxIl0sImp0aSI6IjY0NGI5M2U1LWU3NWUtNGY1MS04ZGQxLTE1MjdlYzM3MTM4NCIsImNsaWVudF9pZCI6InlrIn0.i-VW-yr67mmWhVUgzH030cDownACe0wwmYaEOIQqBUE";
        Claims claims = (Claims) Jwts.parser()
                .setSigningKey("project")
                .parse(jwt).getBody();
        System.out.println("claims = " + claims);



    }

}
    
    