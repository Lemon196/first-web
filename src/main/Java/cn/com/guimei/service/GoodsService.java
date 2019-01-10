package cn.com.guimei.service;

import cn.com.guimei.pojo.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface GoodsService {
    /**
     * 分页查询商品
     * @return
     */
    Map<String,Object> goodsUnionPageList(String pageNumber, Goods goods);

    List<ExtGoods> showSmallClass();
    List<ExtGoods> showDisCount();
    List<ExtGoods> showSeller();
    int addGoods(Goods goods,MultipartFile multipartFile,String filePath);
    //查询所有，作判断商品名唯一性用
    boolean checkGoodsName(String goodsName);
    //删除商品
    int deleteGoods(String id);
    //修改商品
    ExtGoods queryGoodsById(String id);
    int updateGoods(Goods goods);
}
