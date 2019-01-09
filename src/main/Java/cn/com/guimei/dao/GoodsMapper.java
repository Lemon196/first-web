package cn.com.guimei.dao;

import cn.com.guimei.pojo.*;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {
    /**
     * 分页查询商品
     * @return
     */
    List<Goods> goodsWherePageList(Map map);

    int totalWhereRecode(Goods goods);
    //多表查询
    List<ExtGoods> showSmallClass();
    List<ExtGoods> showDisCount();
    List<ExtGoods> showSeller();
    //增加商品
    int addGoods(Goods goods);
    //判断商品名唯一性用
    Goods checkGoodsName(String goodsName);
    //删除商品
    int deleteGoods(String id);
    //修改商品
    ExtGoods queryGoodsById(String id);
    int updateGoods(Goods goods);
}
