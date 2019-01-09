package cn.com.guimei.service.impl;

import cn.com.guimei.dao.GoodsMapper;
import cn.com.guimei.pojo.*;
import cn.com.guimei.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper goodsMapper;

    public Map<String, Object> goodsUnionPageList(String num, Goods goods) {
        if (goods.getId()==null){
            goods.setId((long) 0);
        }
        if (goods.getGoodsName()==null){
            goods.setGoodsName("");
        }
        if (goods.getGoodsSmalId()==null){
            goods.setGoodsSmalId((long)0);
        }
        if (goods.getGoodsSellerId()==null){
            goods.setGoodsSellerId((long)0);
        }
        Map<String,Object> map = new HashMap<String, Object>();
        int pageSize = 3;
        //默认首次访问首页
        int pageNumber = 1;
        if(num!=null && num.length()>0){
            pageNumber = Integer.parseInt(num);
        }

        int pageRecode  = goodsMapper.totalWhereRecode(goods);
        //计算共有多少页
        int totalPage = pageRecode%pageSize==0?pageRecode/pageSize:pageRecode/pageSize+1;
        //求当前页的内容
        int pageIndex = (pageNumber-1)*pageSize;
        Map<String,Object> map1 = new HashMap<String, Object>();
        map1.put("pageIndex",pageIndex);
        map1.put("pageSize",pageSize);
        map1.put("goods",goods);

        List<Goods> goodsList = goodsMapper.goodsWherePageList(map1);
        map.put("pageNumber",pageNumber);
        map.put("tatalPage",totalPage);
        map.put("pageData",goodsList);

        return map;
    }

    public List<ExtGoods> showSmallClass() {

        return goodsMapper.showSmallClass();
    }

    public List<ExtGoods> showDisCount()
    {
        return goodsMapper.showDisCount();
    }

    public List<ExtGoods> showSeller()
    {
        return goodsMapper.showSeller();
    }

    public int addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    public boolean checkGoodsName(String goodsName) {
        boolean flag=false;
        Goods goods=goodsMapper.checkGoodsName(goodsName);
        if (goods!=null){
            flag=true;
        }
        return flag;
    }
    public int deleteGoods(String id) {
        return goodsMapper.deleteGoods(id);
    }

    public ExtGoods queryGoodsById(String id) {
        return goodsMapper.queryGoodsById(id);
    }

    public int updateGoods(Goods goods) {
        return goodsMapper.updateGoods(goods);
    }

}
