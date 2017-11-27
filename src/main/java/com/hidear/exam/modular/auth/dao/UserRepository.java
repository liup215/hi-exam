package com.hidear.exam.modular.auth.dao;

import com.hidear.exam.modular.auth.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by acer on 2017/11/27.
 */
public interface UserRepository extends JpaRepository<User,Integer>{
    public User findByPhoneNumber(String phone);
}
