package cn.com.guimei.controller;

import cn.com.guimei.pojo.*;
import cn.com.guimei.service.GoodsService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Resource
    private GoodsService goodsService;
    @RequestMapping("/unionListGoods")
    public String doGoodsUnionPageList(Goods goods, String pageNumber, HttpServletRequest request){
        Map<String,Object> map  = goodsService.goodsUnionPageList(pageNumber, goods);
        map.put("url","/goods/unionListGoods?id="+goods.getId() +
                "&goodsName="+goods.getGoodsName()+"&goodsSmalId="+goods.getGoodsSmalId()+
                "&goodsSellerId="+goods.getGoodsSellerId()+"&pageNumber=");
        request.setAttribute("Map",map);
        return "showGoods";
    }
    @RequestMapping(value = "/showSmallClass",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String showSmallClass(){
        List<ExtGoods> smallClass=goodsService.showSmallClass();
        return JSONArray.toJSONString(smallClass);
    }
    @RequestMapping(value = "/showDisCount",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String showDisCount(){
        List<ExtGoods> discounts=goodsService.showDisCount();
        return JSONArray.toJSONString(discounts);
    }
    @RequestMapping(value = "/showSeller",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String showSeller(){
        List<ExtGoods> sellers=goodsService.showSeller();
        return JSONArray.toJSONString(sellers);
    }
    @RequestMapping(value = "/addGoods",method = RequestMethod.POST)
    public String addGoods(Goods goods,String goodsName1,String goodsSmalId1, HttpServletRequest request,MultipartFile goodsImages){
        //获取上传路径
        String filePath=request.getRealPath("/static/images/goodsImages");
        goods.setGoodsName(goodsName1);
        goods.setGoodsSmalId(Long.parseLong(goodsSmalId1));
        int i=goodsService.addGoods(goods,goodsImages,filePath);
        if (i==0){
            request.setAttribute("result","增加成功！");
            return "forward:/goods/unionListGoods";
        }else if (i==1){
            request.setAttribute("error","文件为空！");
            return "forward:/goods/unionListGoods";
        }else if (i==2){
            request.setAttribute("error","文件过大！");
            return "forward:/goods/unionListGoods";
        }else if (i==3){
            request.setAttribute("error","文件格式不支持！");
            return "forward:/goods/unionListGoods";
        }else if (i==4){
            request.setAttribute("error","文件路径不存在！");
            return "forward:/goods/unionListGoods";
        }else if (i==5){
            request.setAttribute("error","写入数据库失败！");
        }
        return "forward:/goods/unionListGoods";
    }
    @RequestMapping(value = "/queryGoodsName",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String queryGoodsName(String goodsName){
        boolean result=goodsService.checkGoodsName(goodsName);
        return JSON.toJSONString(result);
    }
    @RequestMapping("jump")
    public String jump(){
        return "addGoods";
    }
    @RequestMapping("/deleteGoods")
    public String deleteGoods(String GId,HttpServletRequest request){
        int i=goodsService.deleteGoods(GId);
        if (i>0){
            request.setAttribute("result","删除成功！");
            return "forward:/goods/unionListGoods";
        }
        request.setAttribute("error","删除失败！");
        return "forward:/goods/unionListGoods";
    }
    @RequestMapping("/queryGoodsById")
    public String queryGoodsById(String GId,HttpServletRequest request){
        ExtGoods goods=goodsService.queryGoodsById(GId);
        if (goods!=null){
            request.setAttribute("Goods",goods);
            return "updateGoodsInfo";
        }
        request.setAttribute("error","修改失败,未找到该商品！");
        return "forward:/goods/unionListGoods";
    }
    @RequestMapping("/updateGoods")
    public String updateGoods(Goods goods,String GId,String GName,String GSmallId,String SeId,HttpServletRequest request,MultipartFile goodsImages){
        goods.setId(Long.parseLong(GId));
        goods.setGoodsName(GName);
        goods.setGoodsSmalId(Long.parseLong(GSmallId));
        goods.setGoodsSellerId(Long.parseLong(SeId));
        goods.setGoodsImage(goodsImages.getOriginalFilename());
        int i=goodsService.updateGoods(goods);
        if (i>0){
            request.setAttribute("result","修改成功！");
            return "forward:/goods/unionListGoods";
        }
        request.setAttribute("error","修改失败");
        return "forward:/goods/unionListGoods";
    }
}
