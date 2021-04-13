package com.yk.web.config;

/**
 * @ClassName: RFC7230
 * @program: yk-project
 * @description: tomcat配置类
 * @author: yk
 * @create: 2021-04-13 15:16
 */

public class RFC7230 {

    /**
     * 解决Tomcat RFC7230问题
     * @return
     */
    /*@Bean
    public ConfigurableServletWebServerFactory webServerFactory() {
        TomcatServletWebServerFactory factory = new TomcatServletWebServerFactory();
        factory.addConnectorCustomizers((TomcatConnectorCustomizer) connector -> {
            connector.setProperty("relaxedQueryChars", "\t-_.|{}[](),/:;<=>?@[\\]{}\\");
            connector.setProperty("relaxedPathChars", "\t-_.|{}[](),/:;<=>?@[\\]{}\\");
            connector.setProperty("rejectIllegalHeader", "false");
        });
        return factory;
    }*/
}
    
    