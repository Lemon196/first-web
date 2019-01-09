package cn.com.guimei.service.impl;

import cn.com.guimei.dao.CustomerMapper;
import cn.com.guimei.pojo.Customer;
import cn.com.guimei.pojo.ExtPage;
import cn.com.guimei.pojo.Page;
import cn.com.guimei.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;

    public List<Customer> customerList() {
        return customerMapper.customerList();
    }

    public Map<String, Object> customerWherePageList(String pageNumber, Customer customer) {
        System.out.println(customer.getId());
        System.out.println(customer.getCusName());
        System.out.println(customer.getCusSex());
        if (customer.getId()==null){
            customer.setId((long) 0);
        }
        if (customer.getCusName()==null){
            customer.setCusName("");
        }
        if (customer.getCusSex()==null){
            customer.setCusSex("");
        }
        Map<String,Object> map=new HashMap<String, Object>();
        //设置默认当前页码
        int pageNum=1;
        if (pageNumber!=null&&pageNumber.length()>0){
            pageNum=Integer.parseInt(pageNumber);
        }
        //设置页面大小
        int pageSize=3;
        //总条数
        int totalCount=customerMapper.totalWhereCount(customer);
        //获取当前页面内容
        int pageIndex=(pageNum-1)*pageSize;
        Map<String,Object> map1=new HashMap<String, Object>();
        map1.put("pageSize",pageSize);
        map1.put("pageIndex",pageIndex);
        map1.put("customer",customer);
        //计算总页数
        int tatalPage=totalCount%pageSize==0?totalCount/pageSize:totalCount/pageSize+1;
        //返回前端的数据
        List<Customer> customerList=customerMapper.customerWherePageList(map1);
        map.put("tatalPage",tatalPage);
        map.put("pageNumber",pageNum);
        map.put("customerList",customerList);
        return map;
    }
    //page分页查询
    public Page<Customer> queryAll(Customer customer,String num) {
        int pageNumber=1;
        if (num!=null&&num.length()>0){
            pageNumber=Integer.parseInt(num);
        }
        int pageSize=5;
        Page<Customer> customerPage=new Page<Customer>();
        customerPage.setPageNumber(pageNumber);
        customerPage.setPageSize(pageSize);

        ExtPage extPage=new ExtPage();
        extPage.setCustomer(customer);
        List<Customer> page=customerMapper.queryAll(extPage);
        customerPage.setPageData(page);

        return customerPage;
    }

    public int deleteCus(String id) {
        return customerMapper.deleteCus(id);
    }

    public Customer queryCusById(String id) {
        return customerMapper.queryCusById(id);
    }

    public int updateCus(Customer customer) {
        return customerMapper.updateCus(customer);
    }
}
