package cn.com.guimei.service.impl;

import cn.com.guimei.dao.GoodsMapper;
import cn.com.guimei.pojo.*;
import cn.com.guimei.service.GoodsService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
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

    public int addGoods(Goods goods, MultipartFile goodsImages, String filePath) {
        if (!goodsImages.isEmpty()){
            if (goodsImages.getSize()<5000000){
                //获取文件名（写入数据库）
                String fileName= goodsImages.getOriginalFilename();
                //获取文件扩展名（判断文件格式）
                String prefix= FilenameUtils.getExtension(fileName);
                if (prefix.equalsIgnoreCase("jpg")
                        ||prefix.equalsIgnoreCase("png")
                        ||prefix.equalsIgnoreCase("jpeg")
                        ||prefix.equalsIgnoreCase("pneg")){
                    //判断文件路径
                    File file=new File(filePath);
                    if (file.exists()){
                        try {
                            //执行文件上传
                            goodsImages.transferTo(new File(file,"/"+fileName));
                            //写入数据库
                            goods.setGoodsImage(fileName);
                            int i=goodsMapper.addGoods(goods);
                            if (i>0){
                                //写入数据库成功
                                return 0;
                            }else {
                                //写入数据库失败
                                return 5;
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }else {
                        //文件路径不存在
                        return 4;
                    }
                }else {
                    //文件格式不支持
                    return 3;
                }
            }else {
                //文件过大
                return 2;
            }
        }
        //文件为空
        return 1;
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
