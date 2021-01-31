package com.yk.common.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @ClassName: Md5Util
 * @program: my-web
 * @description: md5加密类
 * @author: yk
 * @create: 2021-01-02 17:23
 */
public class Md5Util {

    public static String encryptByMD5(String str) throws NoSuchAlgorithmException {
        byte[] strByte = str.getBytes();
        String value = "";
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.update(strByte);
        byte[] bts = md5.digest();
        StringBuilder sb = new StringBuilder();
        //转换为16进制
        for (int i = 0; i < bts.length; i++) {
            if ((bts[i] & 0xff) < 0x10) {
                sb.append("0");
            }
            sb.append(Long.toString(bts[i] & 0xff, 16));
        }
        value = sb.toString();
        return value;
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        String str = "112233";
        String s = Md5Util.encryptByMD5(str);
        System.out.println("s = " + s);
    }

}
    
    