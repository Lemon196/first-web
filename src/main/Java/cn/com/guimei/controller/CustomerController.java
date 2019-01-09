package cn.com.guimei.controller;

import cn.com.guimei.pojo.Customer;
import cn.com.guimei.pojo.Page;
import cn.com.guimei.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {
//    String result=null;
//    HttpServletRequest request;
    @Resource
    private CustomerService customerService;

    @RequestMapping("/customerList")
    public String queryAll(HttpServletRequest request) {
        List<Customer> customerList = customerService.customerList();

        request.getSession().setAttribute("customerList", customerList);
        return "showCustomer";
    }

    //条件分页查询
    @RequestMapping("/customerWhereList")
    public String queryWhereAll(HttpServletRequest request, Customer customer, String pageNumber) {
//        Object result=request.getAttribute("result");
        Map<String, Object> map = customerService.customerWherePageList(pageNumber, customer);
        map.put("url", "/customer/customerWhereList?id=" + customer.getId() + "&cusName=" + customer.getCusName() + "&cusSex=" + customer.getCusSex() + "&pageNumber=");
        /*if(result!=null) {
            map.put("result", result);
        }*/
        request.setAttribute("Map", map);
        return "showCustomer";
    }

    @RequestMapping("/queryAll")
    public String queryAll(HttpServletRequest request, Customer customer, String pageNumber) {
        Page<Customer> page = customerService.queryAll(customer, pageNumber);
        page.setPageUrl("/customer/queryAll?id=" + customer.getId() + "&cusName=" + customer.getCusName() + "&cusSex=" + customer.getCusSex() + "&pageNumber=");
        request.getSession().setAttribute("Page", page);
        return "showCustomer";
    }

    @RequestMapping("/deleteCus")
    public String deleteCus(HttpServletRequest request,String CusId){
        int i=customerService.deleteCus(CusId);
        if (i>0){
//            result=("删除成功！");
            request.setAttribute("result","删除成功！");
//            return InternalResourceViewResolver.REDIRECT_URL_PREFIX+"/WEB-INF/page/showCustomer.jsp";
            return InternalResourceViewResolver.FORWARD_URL_PREFIX+"/customer/customerWhereList";
        }
        request.setAttribute("error","删除失败！");
//        result=("删除失败！");
//        return "showCustomer";
        return InternalResourceViewResolver.FORWARD_URL_PREFIX+"/customer/customerWhereList";
    }

    /*@RequestMapping("/deleteCus")
    public ModelAndView deleteCus(HttpServletRequest request, String id){
        int i=customerService.deleteCus(id);
        ModelAndView modelAndView=new ModelAndView();
        if (i>0){
            modelAndView.addObject("result","删除成功！");
            modelAndView.setViewName("showCustomer");
            return modelAndView;
        }
        modelAndView.addObject("error","删除失败！");
        modelAndView.setViewName("showCustomer");
        return modelAndView;
    }*/

    @RequestMapping("queryCusById")
    public String queryCusById(String id,HttpServletRequest request){
        Customer customer=customerService.queryCusById(id);
        request.setAttribute("Customer",customer);
        return "updateCusInfo";
    }

    @RequestMapping("updateCus")
    public String updateCusById(Customer customer,String cusId,String customerName,HttpServletRequest request){
        customer.setId(Long.parseLong(cusId));
        customer.setCusName(customerName);
        int i=customerService.updateCus(customer);
        if (i>0){
//            result=("修改成功！");
            request.setAttribute("result","修改成功！");
            return InternalResourceViewResolver.FORWARD_URL_PREFIX+"/customer/customerWhereList";
        }
//        result=("修改失败！");
        request.setAttribute("error","修改失败！");
        return InternalResourceViewResolver.FORWARD_URL_PREFIX+"/customer/customerWhereList";
    }
}
