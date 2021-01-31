package com.yk.common.common;

import lombok.Data;

/**
 * @ClassName: Result
 * @program: my-web
 * @description: 返回结果实例对象
 * @author: yk
 * @create: 2020-11-27 21:41
 */
@Data
public class Result {

    private Integer code;

    private String message;

    private Object data;

    private Result() {
    }

    private Result(Integer code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }


    /**
     * <p>Description: 返回正确结果</p>
     *
     * @param message 消息
     * @param data    数据
     * @return com.yk.providerone.common.CommonResult
     * @author yk
     * @date 2020/9/24 11:06
     */
    public static Result success(String message, Object data) {

        int res = 1;
        return new Result(res, message, data);
    }

    /**
     * <p>Description: 返回异常信息</p>
     *
     * @param message 消息
     * @param data    数据
     * @return com.yk.providerone.common.CommonResult
     * @author yk
     * @date 2020/9/24 11:06
     */
    public static Result Failure(String message, Object data) {
        int res = 0;
        return new Result(res, message, data);
    }

}
    
    