package com.YuanZhan.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.YuanZhan.service.UserServiceI;

public class UserServiceTest {
	@Test
	public void test1(){
        // 通过Spring.xml 配置文件创建SpringIOC容器
        ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[]{"classpath:spring.xml"});
        // 获取bean对象
        UserServiceI userService = (UserServiceI) ctx.getBean("userService");
        //do test
        userService.excute();
    }
}