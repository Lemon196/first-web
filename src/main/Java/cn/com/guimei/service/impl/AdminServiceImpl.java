package cn.com.guimei.service.impl;

import cn.com.guimei.dao.AdminMapper;
import cn.com.guimei.pojo.Superuser;
import cn.com.guimei.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper adminMapper;
    public Superuser login(String userLoginName, String userPassword) {
        return adminMapper.login(userLoginName,userPassword);
    }
}
