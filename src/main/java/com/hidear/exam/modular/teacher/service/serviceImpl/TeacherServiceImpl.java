package com.hidear.exam.modular.teacher.service.serviceImpl;

import com.hidear.exam.core.shiro.ShiroKit;
import com.hidear.exam.modular.auth.dao.UserRepository;
import com.hidear.exam.modular.auth.model.User;
import com.hidear.exam.modular.auth.status.UserStatus;
import com.hidear.exam.modular.system.status.UserType;
import com.hidear.exam.modular.teacher.dao.TeacherRepository;
import com.hidear.exam.modular.teacher.model.Teacher;
import com.hidear.exam.modular.teacher.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by acer on 2017/11/27.
 */
@Service
public class TeacherServiceImpl implements ITeacherService {

    @Autowired
    TeacherRepository teacherRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public void add(Teacher teacher) {
        teacher.setcTime((new Date().getTime()));
        teacher.setmTime((new Date().getTime()));
        teacherRepository.save(teacher);

        User user = new User(teacher.getPhone(), teacher.getName(), "", teacher.getPhone(), "", "", "", "", 1, "", new Date().getTime(), new Date().getTime(), 0.00, UserStatus.OK.getCode(), "");
        user.setSalt(ShiroKit.getRandomSalt(6));
        user.setPassword(ShiroKit.md5("123456",user.getSalt()));
        userRepository.save(user);
    }
}
