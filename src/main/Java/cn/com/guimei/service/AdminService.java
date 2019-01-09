package cn.com.guimei.service;

import cn.com.guimei.pojo.Superuser;

public interface AdminService {

    Superuser login(String userLoginName, String userPassword);

}
