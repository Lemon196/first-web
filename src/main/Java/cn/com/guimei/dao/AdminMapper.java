package cn.com.guimei.dao;

import cn.com.guimei.pojo.Superuser;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Superuser login(@Param("userLoginName") String userLoginName,@Param("userPassword") String userPassword);
}
