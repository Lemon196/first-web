package cn.com.guimei.dao;

import cn.com.guimei.pojo.Customer;
import cn.com.guimei.pojo.ExtPage;
import cn.com.guimei.pojo.Page;

import java.util.List;
import java.util.Map;

public interface CustomerMapper {
    //查询所有顾客
    List<Customer> customerList();
    //终极版分页查询与模糊查询
    List<Customer> customerWherePageList(Map map);
    //条件查询所有条数
    int totalWhereCount(Customer customer);
    //利用page类分页查询与模糊查询
    List<Customer> queryAll(ExtPage extPage);



    //id删除顾客
    int deleteCus(String id);


    //id查询顾客
    Customer queryCusById(String id);
    //id修改信息
    int updateCus(Customer customer);
}
