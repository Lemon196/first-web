package cn.com.guimei.service;

import cn.com.guimei.pojo.Customer;
import cn.com.guimei.pojo.Page;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> customerList();
    //终极版分页查询与模糊查询
    Map<String,Object> customerWherePageList(String pageNumber,Customer customer);

    //page分页查询与模糊查询
    Page<Customer> queryAll(Customer customer,String num);

    int deleteCus(String id);

    Customer queryCusById(String id);
    //id修改信息
    int updateCus(Customer customer);
}
