package com.YuanZhan.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.YuanZhan.service.UserServiceI;

public class UserServiceTest {
	@Test
	public void test1(){
        // ͨ��Spring.xml �����ļ�����SpringIOC����
        ApplicationContext ctx = new ClassPathXmlApplicationContext(new String[]{"classpath:spring.xml"});
        // ��ȡbean����
        UserServiceI userService = (UserServiceI) ctx.getBean("userService");
        //do test
        userService.excute();
    }
}