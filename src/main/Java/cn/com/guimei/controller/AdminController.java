
package cn.com.guimei.controller;

import cn.com.guimei.pojo.Superuser;
import cn.com.guimei.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/superUser")
public class AdminController{
    @Resource
    private AdminService adminService;
    @RequestMapping("login")
    public String AdminLogin(HttpServletRequest request, Superuser superuser){
        Superuser superuser1=adminService.login(superuser.getUserLoginName(),superuser.getUserPassword());
        if (superuser1==null){
            request.setAttribute("error","您输入的用户名或密码有误！");
            return "forward:/Login.jsp";
        }
        return "index";
    }
}
