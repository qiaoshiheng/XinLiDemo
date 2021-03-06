package com.YuanZhan.service;

import com.YuanZhan.Entity.User;
import java.util.List;

public interface UserDao {
	
	public int insert(User user);
    
    public int update(User user);
    
    public int delete(String userName);
    
    public List<User> selectAll();
    
    public int countAll();
    
    public User findByUserName(String userName);
}
