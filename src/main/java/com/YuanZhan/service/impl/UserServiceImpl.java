package com.YuanZhan.service.impl;

import org.springframework.stereotype.Service;

import com.YuanZhan.service.UserServiceI;

@Service("userService")
public class UserServiceImpl implements UserServiceI {
	public void excute() 
	{
        System.out.println("succeed");
    }

}
